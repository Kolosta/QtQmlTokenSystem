#include "ColorBlindFilter.h"
#include <cmath>
#include <QDebug>

namespace DS {

ColorBlindFilter::ColorBlindFilter(QObject* parent) : QObject(parent) {}

void ColorBlindFilter::setType(ColorBlindType type) {
    if (m_type != type) {
        m_type = type;
        emit typeChanged();
    }
}

QColor ColorBlindFilter::applyFilter(const QColor& input) const {
    if (m_type == ColorBlindType::Off) {
        return input;
    }
    
    switch (m_type) {
        case ColorBlindType::Deuteranopia:
            return applyMatrix(input, getDeuteranopiaMatrix());
        case ColorBlindType::Protanopia:
            return applyMatrix(input, getProtanopiaMatrix());
        case ColorBlindType::Tritanopia:
            return applyMatrix(input, getTritanopiaMatrix());
        case ColorBlindType::Achromatopsia: {
            // Complete grayscale
            int gray = qGray(input.rgb());
            return QColor(gray, gray, gray, input.alpha());
        }
        default:
            return input;
    }
}

const ColorBlindFilter::Matrix3x3& ColorBlindFilter::getDeuteranopiaMatrix() {
    static const Matrix3x3 matrix = {
        {{
            {0.625f, 0.375f, 0.0f},
            {0.7f,   0.3f,   0.0f},
            {0.0f,   0.3f,   0.7f}
        }}
    };
    return matrix;
}

const ColorBlindFilter::Matrix3x3& ColorBlindFilter::getProtanopiaMatrix() {
    static const Matrix3x3 matrix = {
        {{
            {0.567f, 0.433f, 0.0f},
            {0.558f, 0.442f, 0.0f},
            {0.0f,   0.242f, 0.758f}
        }}
    };
    return matrix;
}

const ColorBlindFilter::Matrix3x3& ColorBlindFilter::getTritanopiaMatrix() {
    static const Matrix3x3 matrix = {
        {{
            {0.95f,  0.05f,  0.0f},
            {0.0f,   0.433f, 0.567f},
            {0.0f,   0.475f, 0.525f}
        }}
    };
    return matrix;
}

QColor ColorBlindFilter::applyMatrix(const QColor& color, const Matrix3x3& matrix) const {
    float r = color.redF();
    float g = color.greenF();
    float b = color.blueF();
    
    float newR = r * matrix.m[0][0] + g * matrix.m[0][1] + b * matrix.m[0][2];
    float newG = r * matrix.m[1][0] + g * matrix.m[1][1] + b * matrix.m[1][2];
    float newB = r * matrix.m[2][0] + g * matrix.m[2][1] + b * matrix.m[2][2];
    
    // Clamp values
    newR = std::clamp(newR, 0.0f, 1.0f);
    newG = std::clamp(newG, 0.0f, 1.0f);
    newB = std::clamp(newB, 0.0f, 1.0f);
    
    return QColor::fromRgbF(newR, newG, newB, color.alphaF());
}

} // namespace DS