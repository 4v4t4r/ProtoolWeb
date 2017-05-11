#!/bin/bash

echo -e "\e[31m______________________________________________________________________________\n"
echo -e "        ▄▄▄·▄▄▄        ▄▄▄▄▄            ▄     ▄▌ ▐ ▄▌▄▄▄ .▄▄▄▄· "
echo -e "       ▐█ ▄██  █·▪      •█  ▪     ▪     █•    █· █▌▐ █▄.▀·▐█ ▀█▪"
echo -e "        ██▀·▐▀▀▄  ▄█▀▄  ▐█.▪ ▄█▀▄  ▄█▀▄ █▪    █▪▐█▐▐▌▐▀▀▪▄▐█▀▀█▄"
echo -e "       ▐█▪·•▐█•█▌▐█▌.▐▌ ▐█· ▐█▌.▐▌▐█▌.▐▌▐▌ ▐▌▐█▌ █▐█▌▐█▄▄▌██▄▪▐█"
echo -e "       .▀   .▀  ▀ ▀█▄▀▪ ▀▀   ▀█▄▀▪ ▀█▄▀▪.▀▀▀  ▀▀▀▀ ▀▪ ▀▀▀ ·▀▀▀▀ \n"
echo -e "\e[0m                      ProtoolWeb CTF Web Based Tool\n"
echo -e "          Updates - https://github.com/ElberTavares/ProtoolWeb/\n"
echo -e "                                 V2.1\n"
echo -e "                       Contact - Twitter @elber333"
echo -e "______________________________________________________________________________\n"

                                                                   


url=$2

function palavra()
{
    
    find -type f -exec strings {} \; | grep -i "$url"
    
}


function clonar_site()
{
    wget -r --timestamping $url
    clear
    echo -e "\e[32m[+] Site Baixado! [+]\n\e[0m"
    curl -I $url
    echo -e "\n\e[32m[+] Costumo olhar os cookies ;) [+]\n\e[0m"
    ls
}

function procurar_b64_local()
{
    for i in $(find -type f -exec strings {} \; | grep -oP '(?:[A-Za-z0-9+/]{4})*(?:[A-Za-z0-9+/]{2}==|[A-Za-z0-9+/]{3}=)?' | sort -u);
    do
    	res=$(echo $i | base64 -d)
    
    	if $(echo "$res" | grep -oP '^([\x00-\x7F]+)$' | grep -qP '([a-zA-Z0-9]{3,})');
    	then
    		echo -e "\e[32m$i: $res\e[0m "
    	fi
    done
}
#Creditos pro covarde que me critica Joao G. Clene
function procurar_b64()
{
    for i in $(curl $url | grep -oP '(?:[A-Za-z0-9+/]{4})*(?:[A-Za-z0-9+/]{2}==|[A-Za-z0-9+/]{3}=)?' | sort -u);
    do
    	res=$(echo $i | base64 -d)
    
    	if $(echo "$res" | grep -oP '^([\x00-\x7F]+)$' | grep -qP '([a-zA-Z0-9]{3,})');
    	then
    		echo -e "\e[32m$i: $res\e[0m "
    	fi
    done
}
val="c"
url=$2
op=$3
pin()
{
    echo -n "Usar Wlist? y/n > "
    read wlist
    case $wlist in
    "y") echo 'Ex > /root/Desktop/list.txt'
	 echo -n "Diretorio > "
	 read dire

    ;;
    esac
    case $wlist in
    	"n")
    	echo -n "ini > "
    	read ini
    	echo -n "fim > "
    	read fim
    ;;
    esac
    if [ $val == "s" ];then
    	exit 0
    fi
    testa()
    {
	
        url=$2
	op=$3
	wd=$4
	case $op in
		"-md5") pin=$(echo -n $1 | md5sum | awk '{print $1}')
	;;
	esac
	case $op in
		"-n") pin=$1
	;;
	esac
        bt=$(echo $url$pin)
	hd=$'Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101 Firefox/45.0'
        if $(curl -A $hd -k $bt 2>/dev/null | grep -q $wd); then
		val="s"
		echo -e "\e[32m[+] Pin encontrado - $pin\e[39m"
		echo -e "Metodo $op | \n $bt"
			
       
        else
        
        	echo -e "\e[31m[ ] Tentando - $pin"
        	#exit 0
       
        fi
    }
    
    export -f testa
     #Aqui ficara a palavra que voce esta buscando. Ex: Flag
    echo -n "Palavra chave > "
    read wd

    case $wlist in
    	"y") cat $dire | xargs -n3 -P10 -I{} bash -c "testa '{}' $url $op $wd $val"
    ;;
    esac
    case $wlist in
    	"n") seq $ini $fim | xargs -n3 -P10 -I{} bash -c "testa '{}' $url $op $wd $val"
    ;;
    esac
}

url=$2
op=$3
ck=$4
wd=$5
pinC()
{
    echo -n "Usar Wlist? y/n > "
    read wlist
    case $wlist in
    	"y") echo 'Ex > /root/Desktop/list.txt'
	 echo -n "Diretorio > "
	 read dire

    ;;
    esac
    case $wlist in
    	"n")
    	echo -n "ini > "
    	read ini
    	echo -n "fim > "
    	read fim
    ;;
    esac
    testa()
    {
   
        url=$2
	op=$3
	ck=$4
	wd=$5
	case $op in
		"-md5") pin=$(echo -n $1 | md5sum | awk '{print $1}')
	;;
	esac
	case $op in
		"-ck") pin=$1
	;;
	esac
        bt=$(echo $url$pin)
        if $(curl -k --cookie "$ck" $bt 2>/dev/null | grep -q $wd); then
        
		echo -e "\e[32m[+] Pin encontrado - $pin\e[39m"
		echo -e "Metodo $op | \n $bt"
       else
          
      	 	echo -e "\e[31m[ ] Tentando - $pin"
        
        fi
    }
    
 

    export -f testa
     #Aqui ira ficar a palavra que voce esta buscando. Ex: Flag
    echo -n "Palavra chave > "
    read wd
    case $wlist in
    	"y") cat $dire | xargs -n4 -P10 -I{} bash -c "testa '{}' $url $op $ck $wd"
    ;;
    esac
    case $wlist in
    	"n") seq $ini $fim | xargs -n4 -P10 -I{} bash -c "testa '{}' $url $op $ck $wd"
    ;;
    esac


}

function lfi()
{

    u=$(echo 'Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101 Firefox/45.0')
    for lfi in $(cat ./includes/wlist/lfi.lst)
        do
    if $(curl -A "$u" $url$lfi 2>/dev/null | grep -q "root:"); then
    
    echo -e "\n\e[32m[+] Vuln Encontrada! - $lfi\e[39m\n"
    echo -e "\n$url$lfi" >> ./includes/lfi_log.txt
    else
    echo -e "\e[31m[-] Tentando - $lfi"
    fi
    done
    clear
    echo -e "\e[32m                            [+] Vulns Encontradas!\n"
    cat ./includes/lfi_log.txt
}

function xss()
{
    echo -n "Type 1 For standard search or 2 for full search> "
    read xso
    case $xso in
        "1") fnd=$(echo "<script>alert('")
    ;;
        "2") fnd=$(echo "')</")
    ;;
    esac
    u=$(echo 'Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101 Firefox/45.0')
    for xss in $(cat ./includes/wlist/xss.txt)
        do
    if $(curl -A "$u" $url"$xss" 2>/dev/null | grep -q $fnd); then
    
    echo -e "\n\e[32m[+] Vuln Encontrada! - $xss\e[39m\n"
    echo -e "\n$url$xss" >> ./includes/xss_log.txt
    else
    echo -e "\n\e[31m[-] Tentando - $xss"
    fi
    done
    clear
    echo -e "\e[32m                            [+] Vulns Encontradas!\n"
    cat ./includes/xss_log.txt
}

function help_pg()
{

    clear
    echo -e "\e[32m [+] -lfi - Buscar e explorar falhas LFI\e[0m
    $0 -lfi URL\n"
    echo -e "\e[32m [+] -xss - Buscar e explorar falhas XSS\e[0m
    $0 -xss URL\n"
    echo -e "\e[32m [+] -P - Buscar por palavra nas strings\e[0m
    $0 -P exemplo\n"
    echo -e "\e[32m [+] -b64 - Buscar por base64 na url\e[0m
    $0 -b64 https://whiteboyz.xyz/bts.js\n"
    echo -e "\e[32m [+] -b64=local - Buscar por base64 na pasta\e[0m
    $0 -b64=local\n"
    echo -e "\e[32m [+] --clone - Clonar site\e[0m
    $0 --clone https://whiteboyz.xyz/\n"
    echo "[+]WORDLISTS ALLOWED[+]"
    echo -e "\e[32m [+] -pin - Para BruteForce numerico via GET\e[0m
    $0 -pin https://whiteboyz.xyz/flag.php?flag= -n\n"
    echo -e " Caso queira converter para md5"
    echo -e "     $0 -pin https://whiteboyz.xyz/md5.php?flag= -md5\n"
    echo -e "\e[32m [+] -pinC - Para BruteForce numerico via GET com cookie\e[0m
    $0 -pinC https://whiteboyz.xyz/flag.php?flag= -ck SEUCOOKIE\n"
    echo -e " Caso queira converter para md5 com cookie "
    echo -e "     $0 -pinC https://whiteboyz.xyz/md5.php?flag= -md5 SEUCOOKIE\n"


    
}


case $1 in
"-xss") xss
;;
"-lfi") lfi
;;
"-h") help_pg
;;
"-pin") pin
;;
"-pinC") pinC
;;
"--clone") clonar_site
;;
"-P") palavra
;;
"-b64") procurar_b64
;;
"-b64=local") procurar_b64_local
;;
*) echo -e "-h for help\n-lfi For check LFI vulns\n-xss for XSS Bruteforce\n--clone URL Para clonar\n-P para buscar palavra nos strings\n-b64=local Para buscar base64 nos strings"
    exit 1
;;
esac
