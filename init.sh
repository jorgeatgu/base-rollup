#!/bin/bash

GREEN='\033[00;32m'
LRED='\033[01;31m'
RED='\033[00;31m'
PURPLE='\033[00;35m'
CYAN='\033[00;36m'
YELLOW='\033[00;33m'

function initRollup {
    echo -n "${LRED}?${LRED} ${CYAN}What kind of project, dataviz or static web? 🤔 "

    function static {
      mkdir css src js img &&
      curl -O "https://raw.githubusercontent.com/jorgeatgu/base-rollup/static/master/{package.json,rollup.config.js,index.html}" &&
      curl -O "https://raw.githubusercontent.com/jorgeatgu/base-rollup/master/{.stylelintrc,.eslintrc,.gitignore,.stylelintignore,.prettierrc.json}" &&
      cd src &&
      mkdir css img js &&
      cd css &&
      curl -O "https://raw.githubusercontent.com/jorgeatgu/base-rollup/master/{_variables.css,styles.css}" &&
      cd ../js &&
      touch index.js &&
      cd ../.. &&
      echo -e "${LRED}Wait a minute...install node modules... 🚨🚨${RED}" &&
      yarn install &&
      echo -e "${GREEN}Mission accomplished C&C! \U0001f913\n" &&
      afplay /System/Library/Sounds/Submarine.aiff &&
      yarn serve
    }

    function dataviz {
      mkdir css src js img &&
      curl -O "https://raw.githubusercontent.com/jorgeatgu/base-rollup/dataviz/master/{package.json,rollup.config.js,index.html}" &&
      curl -O "https://raw.githubusercontent.com/jorgeatgu/base-rollup/master/{.stylelintrc,.eslintrc,.gitignore,.stylelintignore,.prettierrc.json}" &&
      cd src &&
      mkdir css img js &&
      cd css &&
      curl -O "https://raw.githubusercontent.com/jorgeatgu/base-rollup/master/{_variables.css,styles.css}" &&
      cd ../js &&
      curl -O "https://raw.githubusercontent.com/jorgeatgu/base-rollup/master/{d3.js,index.js}" &&
      cd ../.. &&
      git init &&
      git add . &&
      git commit -m 'init' &&
      echo -e "${LRED}Wait a minute...install node modules... 🚨🚨${RED}" &&
      yarn install &&
      echo -e "${GREEN}Mission accomplished C&C! \U0001f913\n" &&
      afplay /System/Library/Sounds/Submarine.aiff &&
      yarn serve
    }

    read -r answer
        if echo "$answer" | grep -iq "^s" ;
    then
        echo -n "${LRED}?${LRED} ${PURPLE}Choose a name for your project: ${YELLOW}"
        read -r var_name &&
        mkdir "$var_name" &&
        cd "$var_name" &&
        echo -e "${GREEN}Here we go again! 🤓"
        static
    else
        echo -n "${LRED}?${LRED} ${PURPLE}Choose a name for your project: ${YELLOW}"
        read -r var_name &&
        mkdir "$var_name" &&
        cd "$var_name" &&
        echo -e "${GREEN}Here we go again! 📊"
        dataviz;
    fi
}
