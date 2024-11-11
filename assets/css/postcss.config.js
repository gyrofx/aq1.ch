const themeDir = __dirname + '/../../';

module.exports = {    
    plugins: [
        require('tailwindcss')(themeDir + 'assets/css/tailwind.config.js'),
        // require('franken-ui/postcss/sort-media-queries')({
        //     sort: 'mobile-first'
		// }),
		// require('franken-ui/postcss/combine-duplicated-selectors')({
        //     removeDuplicatedProperties: true
		// }),
        require('autoprefixer')({
            path: [themeDir]
        }),
    ]
}
