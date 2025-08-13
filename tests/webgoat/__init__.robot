*** Settings ***
Resource         ${EXECDIR}${/}resources${/}keywords${/}webgoat_keywords.robot
Suite Setup      Ensure User Registered
Suite Teardown   Log      done
