#pragma once

#include <QObject>
#include <QColor>
#include <array>

namespace DS {

enum class ColorBlindType {
    Off = 0,
    Deuteranopia = 1,   // Red-green (green weak)
    Protanopia = 2,     // Red-green (red weak)
    Tritanopia = 3,     // Blue-yellow
    Achromatopsia = 4   // Complete color blindness
};

class ColorBlindFilter : public QObject {
    Q_OBJECT
    Q_PROPERTY(ColorBlindType type READ type WRITE setType NOTIFY typeChanged)
    
public:
    explicit ColorBlindFilter(QObject* parent = nullptr);
    
    ColorBlindType type() const { return m_type; }
    void setType(ColorBlindType type);
    
    // Apply colorblind filter to a color
    QColor applyFilter(const QColor& input) const;
    
signals:
    void typeChanged();
    
private:
    ColorBlindType m_type = ColorBlindType::Off;
    
    // Transformation matrices
    struct Matrix3x3 {
        std::array<std::array<float, 3>, 3> m;
    };
    
    static const Matrix3x3& getDeuteranopiaMatrix();
    static const Matrix3x3& getProtanopiaMatrix();
    static const Matrix3x3& getTritanopiaMatrix();
    
    QColor applyMatrix(const QColor& color, const Matrix3x3& matrix) const;
};

} // namespace DS

Q_DECLARE_METATYPE(DS::ColorBlindType)