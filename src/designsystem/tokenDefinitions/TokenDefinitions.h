// #pragma once

// // ============================================================================
// // SYSTÈME DE DÉFINITION CENTRALISÉE DES TOKENS
// // ============================================================================
// // 
// // Ce fichier définit TOUS les tokens du design system en un seul endroit.
// // Les proxies sont générés automatiquement via les macros dans ProxyGenerator.h
// //
// // Pour ajouter un nouveau token :
// // 1. Ajoutez-le dans la section appropriée ci-dessous
// // 2. C'est tout ! Les proxies et propriétés QML sont générés automatiquement
// //
// // ============================================================================

// // ============================================================================
// // SURFACE COLORS
// // ============================================================================
// #define DS_SURFACE_TOKENS \
//     DS_TOKEN(primary, "color.surface.primary") \
//     DS_TOKEN(secondary, "color.surface.secondary") \
//     DS_TOKEN(tertiary, "color.surface.tertiary") \
//     DS_TOKEN(quaternary, "color.surface.quaternary") \
//     DS_TOKEN(inverse, "color.surface.inverse") \
//     DS_TOKEN(hover, "color.surface.hover") \
//     DS_TOKEN(active, "color.surface.active") \
//     DS_TOKEN(selected, "color.surface.selected") \
//     DS_TOKEN(disabled, "color.surface.disabled")

// // ============================================================================
// // BACKGROUND COLORS
// // ============================================================================
// #define DS_BACKGROUND_TOKENS \
//     DS_TOKEN(primary, "color.background.primary") \
//     DS_TOKEN(secondary, "color.background.secondary") \
//     DS_TOKEN(tertiary, "color.background.tertiary") \
//     DS_TOKEN(subtle, "color.background.subtle") \
//     DS_TOKEN(overlay, "color.background.overlay") \
//     DS_TOKEN(scrim, "color.background.scrim")

// // ============================================================================
// // TEXT COLORS
// // ============================================================================
// #define DS_TEXT_TOKENS \
//     DS_TOKEN(primary, "color.text.primary") \
//     DS_TOKEN(secondary, "color.text.secondary") \
//     DS_TOKEN(tertiary, "color.text.tertiary") \
//     DS_TOKEN(disabled, "color.text.disabled") \
//     DS_TOKEN(inverse, "color.text.inverse") \
//     DS_TOKEN(link, "color.text.link") \
//     DS_TOKEN(linkHover, "color.text.linkHover") \
//     DS_TOKEN(placeholder, "color.text.placeholder")

// // ============================================================================
// // BORDER COLORS
// // ============================================================================
// #define DS_BORDER_COLOR_TOKENS \
//     DS_TOKEN(base, "color.border.base") \
//     DS_TOKEN(subtle, "color.border.subtle") \
//     DS_TOKEN(strong, "color.border.strong") \
//     DS_TOKEN(active, "color.border.active") \
//     DS_TOKEN(hover, "color.border.hover") \
//     DS_TOKEN(disabled, "color.border.disabled") \
//     DS_TOKEN(focus, "color.border.focus")

// // ============================================================================
// // ACCENT COLORS
// // ============================================================================
// #define DS_ACCENT_TOKENS \
//     DS_TOKEN(primary, "color.accent.primary") \
//     DS_TOKEN(primaryHover, "color.accent.primaryHover") \
//     DS_TOKEN(primaryActive, "color.accent.primaryActive") \
//     DS_TOKEN(secondary, "color.accent.secondary") \
//     DS_TOKEN(secondaryHover, "color.accent.secondaryHover") \
//     DS_TOKEN(secondaryActive, "color.accent.secondaryActive") \
//     DS_TOKEN(tertiary, "color.accent.tertiary") \
//     DS_TOKEN(subtle, "color.accent.subtle")

// // ============================================================================
// // STATUS COLORS
// // ============================================================================
// #define DS_STATUS_TOKENS \
//     DS_TOKEN(info, "color.status.info") \
//     DS_TOKEN(infoBg, "color.status.infoBg") \
//     DS_TOKEN(infoText, "color.status.infoText") \
//     DS_TOKEN(success, "color.status.success") \
//     DS_TOKEN(successBg, "color.status.successBg") \
//     DS_TOKEN(successText, "color.status.successText") \
//     DS_TOKEN(warning, "color.status.warning") \
//     DS_TOKEN(warningBg, "color.status.warningBg") \
//     DS_TOKEN(warningText, "color.status.warningText") \
//     DS_TOKEN(error, "color.status.error") \
//     DS_TOKEN(errorBg, "color.status.errorBg") \
//     DS_TOKEN(errorText, "color.status.errorText")

// // ============================================================================
// // INTERACTIVE COLORS
// // ============================================================================
// #define DS_INTERACTIVE_TOKENS \
//     DS_TOKEN(base, "color.interactive.default") \
//     DS_TOKEN(hover, "color.interactive.hover") \
//     DS_TOKEN(active, "color.interactive.active") \
//     DS_TOKEN(disabled, "color.interactive.disabled") \
//     DS_TOKEN(focus, "color.interactive.focus")

// // ============================================================================
// // SPACING
// // ============================================================================
// #define DS_SPACING_TOKENS \
//     DS_TOKEN(xxxs, "spacing.xxxs") \
//     DS_TOKEN(xxs, "spacing.xxs") \
//     DS_TOKEN(xs, "spacing.xs") \
//     DS_TOKEN(sm, "spacing.sm") \
//     DS_TOKEN(md, "spacing.md") \
//     DS_TOKEN(lg, "spacing.lg") \
//     DS_TOKEN(xl, "spacing.xl") \
//     DS_TOKEN(xxl, "spacing.xxl") \
//     DS_TOKEN(xxxl, "spacing.xxxl") \
//     DS_TOKEN(xxxxl, "spacing.xxxxl")

// // ============================================================================
// // RADIUS
// // ============================================================================
// #define DS_RADIUS_TOKENS \
//     DS_TOKEN(none, "radius.none") \
//     DS_TOKEN(xs, "radius.xs") \
//     DS_TOKEN(sm, "radius.sm") \
//     DS_TOKEN(md, "radius.md") \
//     DS_TOKEN(lg, "radius.lg") \
//     DS_TOKEN(xl, "radius.xl") \
//     DS_TOKEN(xxl, "radius.xxl") \
//     DS_TOKEN(full, "radius.full")

// // ============================================================================
// // BORDER WIDTH
// // ============================================================================
// #define DS_BORDER_TOKENS \
//     DS_TOKEN(none, "border.none") \
//     DS_TOKEN(thin, "border.thin") \
//     DS_TOKEN(medium, "border.medium") \
//     DS_TOKEN(thick, "border.thick") \
//     DS_TOKEN(button, "border.button") \
//     DS_TOKEN(input, "border.input")

// // ============================================================================
// // ELEVATION (SHADOWS)
// // ============================================================================
// #define DS_ELEVATION_TOKENS \
//     DS_TOKEN(none, "elevation.none") \
//     DS_TOKEN(xs, "elevation.xs") \
//     DS_TOKEN(sm, "elevation.sm") \
//     DS_TOKEN(md, "elevation.md") \
//     DS_TOKEN(lg, "elevation.lg") \
//     DS_TOKEN(xl, "elevation.xl")

// // ============================================================================
// // OPACITY
// // ============================================================================
// #define DS_OPACITY_TOKENS \
//     DS_TOKEN(disabled, "opacity.disabled") \
//     DS_TOKEN(hover, "opacity.hover") \
//     DS_TOKEN(overlay, "opacity.overlay") \
//     DS_TOKEN(scrim, "opacity.scrim")

// // ============================================================================
// // TYPOGRAPHY
// // ============================================================================
// #define DS_TYPOGRAPHY_TOKENS \
//     DS_TOKEN(fontFamilyPrimary, "typography.fontFamily.primary") \
//     DS_TOKEN(fontFamilyMono, "typography.fontFamily.mono") \
//     DS_TOKEN(fontSizeXs, "typography.fontSize.xs") \
//     DS_TOKEN(fontSizeSm, "typography.fontSize.sm") \
//     DS_TOKEN(fontSizeMd, "typography.fontSize.md") \
//     DS_TOKEN(fontSizeLg, "typography.fontSize.lg") \
//     DS_TOKEN(fontSizeXl, "typography.fontSize.xl") \
//     DS_TOKEN(fontSizeXxl, "typography.fontSize.xxl") \
//     DS_TOKEN(fontSizeXxxl, "typography.fontSize.xxxl") \
//     DS_TOKEN(fontWeightRegular, "typography.fontWeight.regular") \
//     DS_TOKEN(fontWeightMedium, "typography.fontWeight.medium") \
//     DS_TOKEN(fontWeightBold, "typography.fontWeight.bold") \
//     DS_TOKEN(lineHeightTight, "typography.lineHeight.tight") \
//     DS_TOKEN(lineHeightNormal, "typography.lineHeight.normal") \
//     DS_TOKEN(lineHeightRelaxed, "typography.lineHeight.relaxed")

// // ============================================================================
// // ANIMATION
// // ============================================================================
// #define DS_ANIMATION_TOKENS \
//     DS_TOKEN(durationFast, "animation.duration.fast") \
//     DS_TOKEN(durationNormal, "animation.duration.normal") \
//     DS_TOKEN(durationSlow, "animation.duration.slow") \
//     DS_TOKEN(easingStandard, "animation.easing.standard") \
//     DS_TOKEN(easingDecelerate, "animation.easing.decelerate") \
//     DS_TOKEN(easingAccelerate, "animation.easing.accelerate")

// // ============================================================================
// // Z-INDEX
// // ============================================================================
// #define DS_ZINDEX_TOKENS \
//     DS_TOKEN(dropdown, "zIndex.dropdown") \
//     DS_TOKEN(modal, "zIndex.modal") \
//     DS_TOKEN(tooltip, "zIndex.tooltip") \
//     DS_TOKEN(notification, "zIndex.notification")

// // ============================================================================
// // COMPONENT: BUTTON
// // ============================================================================
// #define DS_BUTTON_TOKENS \
//     DS_TOKEN(height, "component.button.height") \
//     DS_TOKEN(heightSm, "component.button.heightSm") \
//     DS_TOKEN(heightLg, "component.button.heightLg") \
//     DS_TOKEN(paddingX, "component.button.paddingX") \
//     DS_TOKEN(paddingY, "component.button.paddingY") \
//     DS_TOKEN(borderWidth, "component.button.borderWidth") \
//     DS_TOKEN(radius, "component.button.radius") \
//     DS_TOKEN(gap, "component.button.gap") \
//     DS_TOKEN(fontSize, "component.button.fontSize")

// // ============================================================================
// // COMPONENT: ICON BUTTON
// // ============================================================================
// #define DS_ICONBUTTON_TOKENS \
//     DS_TOKEN(size, "component.iconButton.size") \
//     DS_TOKEN(sizeSm, "component.iconButton.sizeSm") \
//     DS_TOKEN(sizeLg, "component.iconButton.sizeLg") \
//     DS_TOKEN(radius, "component.iconButton.radius")

// // ============================================================================
// // COMPONENT: INPUT
// // ============================================================================
// #define DS_INPUT_TOKENS \
//     DS_TOKEN(height, "component.input.height") \
//     DS_TOKEN(heightSm, "component.input.heightSm") \
//     DS_TOKEN(heightLg, "component.input.heightLg") \
//     DS_TOKEN(paddingX, "component.input.paddingX") \
//     DS_TOKEN(paddingY, "component.input.paddingY") \
//     DS_TOKEN(borderWidth, "component.input.borderWidth") \
//     DS_TOKEN(radius, "component.input.radius") \
//     DS_TOKEN(fontSize, "component.input.fontSize")

// // ============================================================================
// // COMPONENT: CARD
// // ============================================================================
// #define DS_CARD_TOKENS \
//     DS_TOKEN(padding, "component.card.padding") \
//     DS_TOKEN(paddingSm, "component.card.paddingSm") \
//     DS_TOKEN(paddingLg, "component.card.paddingLg") \
//     DS_TOKEN(gap, "component.card.gap") \
//     DS_TOKEN(radius, "component.card.radius") \
//     DS_TOKEN(borderWidth, "component.card.borderWidth")

// // ============================================================================
// // COMPONENT: MENU BAR
// // ============================================================================
// #define DS_MENUBAR_TOKENS \
//     DS_TOKEN(height, "component.menubar.height") \
//     DS_TOKEN(paddingX, "component.menubar.paddingX") \
//     DS_TOKEN(itemGap, "component.menubar.itemGap")

// // ============================================================================
// // COMPONENT: SIDEBAR
// // ============================================================================
// #define DS_SIDEBAR_TOKENS \
//     DS_TOKEN(width, "component.sidebar.width") \
//     DS_TOKEN(widthCollapsed, "component.sidebar.widthCollapsed") \
//     DS_TOKEN(padding, "component.sidebar.padding") \
//     DS_TOKEN(itemHeight, "component.sidebar.itemHeight") \
//     DS_TOKEN(itemGap, "component.sidebar.itemGap")

// // ============================================================================
// // COMPONENT: TOOLTIP
// // ============================================================================
// #define DS_TOOLTIP_TOKENS \
//     DS_TOKEN(padding, "component.tooltip.padding") \
//     DS_TOKEN(radius, "component.tooltip.radius") \
//     DS_TOKEN(fontSize, "component.tooltip.fontSize") \
//     DS_TOKEN(maxWidth, "component.tooltip.maxWidth")

// // ============================================================================
// // COMPONENT: MODAL
// // ============================================================================
// #define DS_MODAL_TOKENS \
//     DS_TOKEN(padding, "component.modal.padding") \
//     DS_TOKEN(radius, "component.modal.radius") \
//     DS_TOKEN(maxWidth, "component.modal.maxWidth") \
//     DS_TOKEN(headerHeight, "component.modal.headerHeight")

// // ============================================================================
// // COMPONENT: DROPDOWN
// // ============================================================================
// #define DS_DROPDOWN_TOKENS \
//     DS_TOKEN(padding, "component.dropdown.padding") \
//     DS_TOKEN(radius, "component.dropdown.radius") \
//     DS_TOKEN(itemHeight, "component.dropdown.itemHeight") \
//     DS_TOKEN(maxHeight, "component.dropdown.maxHeight")


// // EOF