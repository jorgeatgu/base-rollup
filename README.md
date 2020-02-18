
# ROLLUP BASE D3

Starter kit for data-viz or static web projects. 
The starter kit is ready to work with a reduced version of d3 based on importing only the [necessary modules](https://github.com/jorgeatgu/base-rollup-d3/blob/master/src/js/d3.js).

## Getting Started

```
yarn install
```

```
yarn serve
```

## Plugins

**Linters**: eslint[ JavaScript ] & Stylelint[ CSS ]   
**Minifiy**: teser[ JavaScript ] & CSSnano[ CSS ]   
**Server**: Browsersync   
**Lint-staged**: lint CSS files with Stylelint and JS files with Eslint before push to repository   

## Script to init

[Bash script](https://github.com/jorgeatgu/base-rollup/blob/master/init.sh) to create a structure like this:

```bash

├─ src/              
│  ├─ css/           
│  ├─ img/           
│  └─ js/            
│
├─ css/              
├─ js/               
├─ img/              
├─ .gitignore        
├─ .eslintrc        
├─ .stylelintrc      
├─ index.html        
├─ rollup.config.js       
└─ package.json      
```

## License

[MIT](LICENSE) © Jorge Aznar