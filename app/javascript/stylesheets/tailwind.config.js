const colors = require('tailwindcss/colors')

module.exports = {
  purge: [],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      colors: {
        rose: colors.rose,
        // https://javisperez.github.io/tailwindcolorshades/
        'primary': {
          '50': '#fff5f3',
          '100': '#ffece7',
          '200': '#ffcfc4',
          '300': '#ffb3a1',
          '400': '#ff795a',
          '500': '#ff4013',
          '600': '#e63a11',
          '700': '#bf300e',
          '800': '#99260b',
          '900': '#7d1f09'
        }
      }
    }
  },
  variants: {
    extend: {},
  },
  plugins: [
    require('@tailwindcss/forms'),
  ]
}
