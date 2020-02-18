#!/bin/bash

GREEN='\033[00;32m'
LRED='\033[01;31m'
RED='\033[00;31m'
PURPLE='\033[00;35m'
CYAN='\033[00;36m'
YELLOW='\033[00;33m'

function initRollup {
    echo -n "${CYAN}What kind of project, dataviz or static web? 🤔"

    read -r answer
        if echo "$answer" | grep -iq "^s" ;
    then
        echo -n "${PURPLE}Choose a name for your project: ${YELLOW}"
        read -r var_name &&
        mkdir "$var_name" &&
        cd "$var_name" &&
        echo -e "${GREEN} Here we go again! "
        launch static;
    else
        echo -n "${PURPLE}Choose a name for your project: ${YELLOW}"
        read -r var_name &&
        mkdir "$var_name" &&
        cd "$var_name" &&
        echo -e "${GREEN} Here we go again!"
        launch dataviz;
    fi

    function launch {
      mkdir css src js img &&
      if [ "$1" = 'dataviz' ]
      then
        curl -O "https://raw.githubusercontent.com/jorgeatgu/base-rollup-d3/master/{.stylelintrc,.eslintrc,.gitignore,.stylelintignore,package.json,rollup.config.js,index.html}"
      else
        curl -O "https://raw.githubusercontent.com/jorgeatgu/base-rollup/master/{.stylelintrc,.eslintrc,.gitignore,.stylelintignore,package.json,rollup.config.js,index.html}"
      fi
      cd src &&
      mkdir css img js &&
      cd css &&
      curl -O "https://raw.githubusercontent.com/jorgeatgu/base-rollup-d3/master/{_variables.css,styles.css}" &&
      cd ../js &&
      if [ "$1" = 'dataviz' ]
        then
          curl -O "https://raw.githubusercontent.com/jorgeatgu/base-rollup-d3/master/{d3.js,index.js}"
      else
        curl -O "https://raw.githubusercontent.com/jorgeatgu/base-rollup-d3/master/{index.js}"
      fi
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
}
