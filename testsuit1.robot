*** Settings ***
Resource          newresource.txt

*** Variables ***
${scalar}         Hello
@{list}           laowu    13599920032    fujian.yongding    \    zhangcq    18978545233    fujian.sanming
...               \    zhangxm    18377845233    gansu.jiuquan

*** Test Cases ***
case1
    [Tags]    A    ALL
    log    ${scalar}
    log many    @{list}
    log    %{JAVA_HOME}

case2
    [Tags]    B    ALL
    ${int}    Evaluate    int(1)
    ${type}    Evaluate    type(${int})
    log    ${int}
    log    ${type}
    ${val1}    Set Variable    abcd
    ${valif}    Set Variable If    '${val1}'=='abcd'    efgh    abb
    ${getVal1}    Get Length    ${val1}
    ${getVal2}    Get Time
    Run Keyword If    '${val1}'=='abcd'    log    efgh
    log    hi${val1}
    log    ${val1[2]}
    log    ${val1[1:]}
    ${cal1}    Set Variable    123
    ${cal2}    Evaluate    ${cal1}+2
    @{val3}    Set Variable    1    2    3
    @{crlist}    Create List    3    2    1
    log    ${crlist}
    log    how are you!    WARN
    Run Keyword    log    and you?    ERROR
    @{val4}    Create List    ok?    WARN
    ${val5}    Set Variable    log
    Run Keyword    ${val5}    @{val4}
    log    @{val3}[1]
    log    ${val3[1]}
    @{lista}    Create List    ${val3}    ${crlist}    5
    log    @{lista[1]}[1]
    log    ${lista[1][1]}
    &{dict}    Create Dictionary    a=2    b=3
    log    &{dict}=

case3
    [Tags]    A    ALL    B
    MyKeyWord    how?    are    you    and    you!
    ${returnVal1}    MyKeyWord-1    how?
    log    ${returnVal1}
    ${returnVal2}    MyKeyWord-2    mykeyword-2
    @{returnVal3}    MyKeyWord-2    mykeyword-2
    ${returnVal4}    ${returnVal5}    MyKeyWord-2    mykeyword-2
    log    ${returnVal2}
    log    @{returnVal3}=
    log    ${returnVal4}=${returnVal5}

case4
    [Tags]    ALL
    :FOR    ${i}    IN RANGE    4
    \    log    ${i}
    :FOR    ${j}    IN RANGE    120    100    -2
    \    log    ${j}
    @{list}    Create List    1    2    a    b
    :FOR    ${r}    IN    @{list}
    \    log    ${r}
    ${score}    Set Variable    55
    #${score}    Evaluate    input('please input the num:')
    Run Keyword If    ${score}>=90    log    A
    ...    ELSE IF    ${score}>=70    log    B
    ...    ELSE IF    ${score}>=60    log    C
    ...    ELSE    log    D
    :FOR    ${K}    IN RANGE    10
    \    Run Keyword If     ${K}%2!=0    log    ${K}
