#!/usr/bin/env bash
#
# Description: Test your server's network with Speedtest to China
#
# Copyright (C) 2017 - 2017 Oldking <oooldking@gmail.com>
#
# URL: https://www.oldking.net/305.html
#

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
SKYBLUE='\033[0;36m'
PLAIN='\033[0m'

# check root
[[ $EUID -ne 0 ]] && echo -e "${RED}Error:${PLAIN} This script must be run as root!" && exit 1

# check python
if  [ ! -e '/usr/bin/python' ]; then
        echo -e
        read -p "${RED}Error:${PLAIN} python is not install. You must be install python command at first.\nDo you want to install? [y/n]" is_install
        if [[ ${is_install} == "y" || ${is_install} == "Y" ]]; then
            if [ "${release}" == "centos" ]; then
                        yum -y install python
                else
                        apt-get -y install python
                fi
        else
            exit
        fi
        
fi

# check wget
if  [ ! -e '/usr/bin/wget' ]; then
        echo -e
        read -p "${RED}Error:${PLAIN} wget is not install. You must be install wget command at first.\nDo you want to install? [y/n]" is_install
        if [[ ${is_install} == "y" || ${is_install} == "Y" ]]; then
                if [ "${release}" == "centos" ]; then
                        yum -y install wget
                else
                        apt-get -y install wget
                fi
        else
                exit
        fi
fi


clear
echo "#############################################################"
echo "# Description: Test your server's network with Speedtest    #"
echo "# Intro:  https://www.oldking.net/305.html                  #"
echo "# Author: Oldking <oooldking@gmail.com>                     #"
echo "# Github: https://github.com/oooldking                      #"
echo "#############################################################"
echo
echo "Test server to"
echo -ne "1. China Telecom 2. China Unicom 3. China mobile 4. Local default 5. Comprehensive speed measurement"

while :; do echo
        read -p "Please enter a number selection: " telecom
        if [[ ! $telecom =~ ^[1-5]$ ]]; then
                echo "Input error! Please enter the correct number!"
        else
                break   
        fi
done

if [[ ${telecom} == 1 ]]; then
        telecomName="telecommunications"
        echo -e "\nChoose the position closest to you"
    echo -ne "1. North 2. South"
    while :; do echo
            read -p "Please enter a number selection: " pos
            if [[ ! $pos =~ ^[1-2]$ ]]; then
                    echo "Input error! Please enter the correct number!"
            else
                    break
            fi
    done
    echo -e "\nChoose the city closest to you"
    if [[ ${pos} == 1 ]]; then
        echo -ne "1.Zhengzhou 2.Fuyang"
        while :; do echo
                read -p "Please enter a number selection: " city
                if [[ ! $city =~ ^[1-2]$ ]]; then
                        echo "Input error! Please enter the correct number!"
                else
                        break
            fi
        done
        if [[ ${city} == 1 ]]; then
                num=4595
                cityName="Zhengzhou"
        fi
        if [[ ${city} == 2 ]]; then
                num=12637
                cityName="Fuyang"
        fi
    fi
    if [[ ${pos} == 2 ]]; then
        echo -ne "1.Shanghai 2.Hangzhou 3.Nanning 4.Nanchang 5.Changsha 6.Shenzhen 7.Chongqing 8.Chengdu"
        while :; do echo
                read -p "Please enter a number selection: " city
                if [[ ! $city =~ ^[1-8]$ ]]; then
                        echo "Input error! Please enter the correct number!"
                else
                        break
            fi
        done
        if [[ ${city} == 1 ]]; then
                num=3633
                cityName="Shanghai"
        fi
        if [[ ${city} == 2 ]]; then
                num=7509
                cityName="Hangzhou"
        fi
        if [[ ${city} == 3 ]]; then
                num=10305
                cityName="Nanning"
        fi
        if [[ ${city} == 4 ]]; then
                num=7230
                cityName="Nanchang"
        fi
        if [[ ${city} == 5 ]]; then
                num=6132
                cityName="Changsha"
        fi
        if [[ ${city} == 6 ]]; then
                num=5081
                cityName="Shenzhen"
        fi
        if [[ ${city} == 7 ]]; then
                num=6592
                cityName="Chongqing"
        fi
        if [[ ${city} == 8 ]]; then
                num=4624
                cityName="Chengdu"
        fi
    fi
fi

if [[ ${telecom} == 2 ]]; then
        telecomName="Unicom"
    echo -ne "\n1. North 2. South"
    while :; do echo
            read -p "Please enter a number selection: " pos
            if [[ ! $pos =~ ^[1-2]$ ]]; then
                    echo "Input error! Please enter the correct number!"
            else
                    break
            fi
    done
    echo -e "\nChoose the city closest to you"
    if [[ ${pos} == 1 ]]; then
        echo -ne "1.Shenyang 2.Changchun 3.Harbin 4.Tianjin 5.Jinan 6.Beijing 7.Zhengzhou 8.Xi'an 9.Taiyuan 10.Ningxia 11.Lanzhou 12.Xining"
        while :; do echo
                read -p "Please enter a number selection: " city
                if [[ ! $city =~ ^(([1-9])|(1([0-2]{1})))$ ]]; then
                        echo "Input error! Please enter the correct number!"
                else
                        break
            fi
        done
        if [[ ${city} == 1 ]]; then
                num=5017
                cityName="Shenyang"
        fi
        if [[ ${city} == 2 ]]; then
                num=9484
                cityName="Changchun"
        fi
        if [[ ${city} == 3 ]]; then
                num=5460
                cityName="Harbin"
        fi
        if [[ ${city} == 4 ]]; then
                num=5475
                cityName="Tianjin"
        fi
        if [[ ${city} == 5 ]]; then
                num=5039
                cityName="Jinan"
        fi
        if [[ ${city} == 6 ]]; then
                num=5145
                cityName="Beijing"
        fi
        if [[ ${city} == 7 ]]; then
                num=5131
                cityName="Zhengzhou"
        fi
        if [[ ${city} == 8 ]]; then
                num= 4863
                cityName="Xi'an"
        fi
        if [[ ${city} == 9 ]]; then
                num=12868
                cityName="Taiyuan"
        fi
        if [[ ${city} == 10 ]]; then
                num=5509
                cityName="Ningxia"
        fi
        if [[ ${city} == 11 ]]; then
                num=4690
                cityName="Lanzhou"
        fi
        if [[ ${city} == 12 ]]; then
                num=5992
                cityName="Xining"
        fi
    fi
    if [[ ${pos} == 2 ]]; then
        echo -ne "1.Shanghai 2.Hangzhou 3.Nanning 4.Hefei 5.Nanchang 6.Changsha 7.Shenzhen 8.Guangzhou 9.Chongqing 10.Guangzhou 11.Chengdu"
        while :; do echo
                read -p "Please enter a number selection: " city
                if [[ ! $city =~ ^(([1-9])|(1([0-1]{1})))$ ]]; then
                        echo "Input error! Please enter the correct number!"
                else
                        break
            fi
        done
        if [[ ${city} == 1 ]]; then
                num=5083
                cityName="Shanghai"
        fi
        if [[ ${city} == 2 ]]; then
                num=5300
                cityName="Hangzhou"
        fi
        if [[ ${city} == 3 ]]; then
                num=5674
                cityName="Nanning"
        fi
        if [[ ${city} == 4 ]]; then
                num=5724
                cityName="Hefei"
        fi
        if [[ ${city} == 5 ]]; then
                num=5079
                cityName="Nanchang"
        fi
        if [[ ${city} == 6 ]]; then
                num=4870
                cityName="Changsha"
        fi
        if [[ ${city} == 7 ]]; then
                num=10201
                cityName="Shenzhen"
        fi
        if [[ ${city} == 8 ]]; then
                num=3891
                cityName="Guangzhou"
        fi
        if [[ ${city} == 9 ]]; then
                num=5726
                cityName="Chongqing"
        fi
        if [[ ${city} == 10 ]]; then
                num=5103
                cityName="Guangzhou"
        fi
        if [[ ${city} == 11 ]]; then
                num=2461
                cityName="Chengdu"
        fi
    fi
fi

if [[ ${telecom} == 3 ]]; then
        telecomName="mobile"
    echo -ne "\n1. North 2. South"
    while :; do echo
            read -p "Please enter a number selection: " pos
            if [[ ! $pos =~ ^[1-2]$ ]]; then
                    echo "Input error! Please enter the correct number!"
            else
                    break
            fi
    done
    echo -e "\nChoose the city closest to you"
    if [[ ${pos} == 1 ]]; then
        echo -ne "1.Xi'an"
        while :; do echo
                read -p "Please enter a number selection: " city
                if [[ ! $city =~ ^[1]$ ]]; then
                        echo "Input error! Please enter the correct number!"
                else
                        break
            fi
        done
        if [[ ${city} == 1 ]]; then
                num=5292
        fi
    fi
    if [[ ${pos} == 2 ]]; then
        echo -ne "1.Shanghai 2.Ningbo 3.Wuxi 4.Hangzhou 5.Hefei 6.Chengdu"
        while :; do echo
                read -p "Please enter a number selection: " city
                if [[ ! $city =~ ^[1-6]$ ]]; then
                        echo "Input error! Please enter the correct number!"
                else
                        break
            fi
        done
        if [[ ${city} == 1 ]]; then
                num=4665
                cityName="Shanghai"
        fi
        if [[ ${city} == 2 ]]; then
                num=6715
                cityName="Ningbo"
        fi
        if [[ ${city} == 3 ]]; then
                num=5122
                cityName="Wuxi"
        fi
        if [[ ${city} == 4 ]]; then
                num=4647
                cityName="Hangzhou"
        fi
        if [[ ${city} == 5 ]]; then
                num=4377 
                cityName="Hefei"
        fi
        if [[ ${city} == 6 ]]; then
                num=4575
                cityName="Chengdu"
        fi
    fi
fi

# install speedtest
if  [ ! -e '/tmp/speedtest.py' ]; then
    wget --no-check-certificate -P /tmp https://raw.github.com/sivel/speedtest-cli/master/speedtest.py > /dev/null 2>&1
fi
chmod a+rx /tmp/speedtest.py

result() {
    download=`cat /tmp/speed.log | awk -F ':' '/Download/{print $2}'`
    upload=`cat /tmp/speed.log | awk -F ':' '/Upload/{print $2}'`
    hostby=`cat /tmp/speed.log | awk -F ':' '/Hosted/{print $1}'`
    latency=`cat /tmp/speed.log | awk -F ':' '/Hosted/{print $2}'`
    clear
    echo "$hostby"
    echo "delay  : $latency"
    echo "Upload  : $upload"
    echo "Download  : $download"
    echo -ne "\n current time: "
    echo $(date +%Y-%m-%d" "%H:%M:%S)
}

speed_test(){
	temp=$(python /tmp/speedtest.py --server $1 --share 2>&1)
	is_down=$(echo "$temp" | grep 'Download') 
	if [[ ${is_down} ]]; then
        local REDownload=$(echo "$temp" | awk -F ':' '/Download/{print $2}')
        local reupload=$(echo "$temp" | awk -F ':' '/Upload/{print $2}')
        local relatency=$(echo "$temp" | awk -F ':' '/Hosted/{print $2}')
        temp=$(echo "$relatency" | awk -F '.' '{print $1}')
        if [[ ${temp} -gt 1000 ]]; then
            relatency=" 000.000 ms"
        fi
        local nodeName=$2

        printf "${YELLOW}%-17s${GREEN}%-18s${RED}%-20s${SKYBLUE}%-12s${PLAIN}\n" "${nodeName}" "${reupload}" "${REDownload}" "${relatency}"
	else
        local cerror="ERROR"
	fi
}

if [[ ${telecom} =~ ^[1-3]$ ]]; then
    python /tmp/speedtest.py --server ${num} --share 2>/dev/null | tee /tmp/speed.log 2>/dev/null
    is_down=$(cat /tmp/speed.log | grep 'Download')

    if [[ ${is_down} ]]; then
        result
        echo "Test to ${cityName}${telecomName} Complete!"
        rm -rf /tmp/speedtest.py
        rm -rf /tmp/speed.log
    else
	    echo -e "\n${RED}ERROR:${PLAIN} The current node is unavailable. Please replace other nodes or test again after changing time periods."
	fi
fi

if [[ ${telecom} == 4 ]]; then
    python /tmp/speedtest.py | tee /tmp/speed.log
    result
    echo "Local testing is complete!"
    rm -rf /tmp/speedtest.py
    rm -rf /tmp/speed.log
fi

if [[ ${telecom} == 5 ]]; then
	echo ""
	printf "%-14s%-18s%-20s%-12s\n" "Node Name" "Upload Speed" "Download Speed" "Latency"
	start=$(date +%s) 
    speed_test '6435' 'Fuyang Telecom'
    speed_test '7509' 'Kunming Telecom'
    speed_test '3633' 'Shanghai Telecom'
    speed_test '4624' 'Chengdu Telecom'
    speed_test '5017' 'Shenyang Unicom'
    speed_test '4863' 'Xian Unicom'
    speed_test '5083' 'Shanghai Unicom'
    speed_test '5726' 'Chongqing Unicom'
    speed_test '5292' 'Xian Mobile'
    speed_test '16314' 'Shandong Mobile'
    speed_test '6715' 'Ningbo Mobile'
    speed_test '4575' 'Chengdu Mobile'
	end=$(date +%s)  
	rm -rf /tmp/speedtest.py
	echo ""
	time=$(( $end - $start ))
	if [[ $time -gt 60 ]]; then
		min=$(expr $time / 60)
		sec=$(expr $time % 60)
		echo -ne "Spend time: ${min} 分 ${sec} 秒"
	else
		echo -ne "Spend time:${time} 秒"
	fi
	echo -ne "\n current time:"
    echo $(date +%Y-%m-%d" "%H:%M:%S)
	echo "Comprehensive testing is complete!"
fi
