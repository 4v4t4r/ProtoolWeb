#  :octocat: ProtoolWeb CTF Web Based Tool
Protoolweb is a tool that is being developed to help and facilitate the exploration of online applications in the Capture The Flag championships, popularly known as CTF or Hackaflag.

As we are still in version 2.0, I hope to receive suggestions of more functions to implement the program!

#  :wrench: Functions

# Search and browse for faults LFI
*LFI Bruteforce*

*This function tests various combinations of directories with possible RFI on the victim target site Ex:*

`./PWeb.sh -lfi URL`
# Cross-Site Scripting (XSS) Bruteforce
*This function tests various combinations of directories with possibleXSS on the victim target site Ex:*

`./PWeb.sh -xss URL`


# Search for strings in all files in the folder

*Ex:*

`./PWeb.sh -P flag`


# Search for Base64 on the whole page and high decode

Function made to automate a search for Base64-encrypted strings.

*Ex:*

`./PWeb.sh -b64 https://whiteboyz.xyz/bts.js`

You can also search for Base64 on all files in the folders using:

`./PWeb.sh -b64=local` The parameter`local` It should NOT be changed.

It can be very useful if used together with the `--clone`

# Clone Site

This function clones the entire site that will be parsed.

*Ex:*

`./PWeb.sh --clone https://whiteboyz.xyz/`


# BruteForce since GET method

Function made to test sequences of numbers or words passed via GET in the challenge. Many CTF Web challenges require something similar.

*Ex:*

`./PWeb.sh -pin https://whiteboyz.xyz/flag.php?flag= -n` The `-pin` It means requesting only the pin.

> Usar Wlist? y/n > 

If you do NOT want to use WordList select `n`

> ini >

Represents the initial number of the test. Ex: `1`

> fim >

Represents the end number of the test. Ex: `100`

# Brute Force with GET method & Convert request to MD5 hash

`./PWeb.sh -pin https://whiteboyz.xyz/md5.php?flag= -md5`

# Brute Force with GET method with cookie

To request with Cookies:

*Ex:*

`./PWeb.sh -pinC https://whiteboyz.xyz/flag.php?flag= -ck SEUCOOKIE`

To request cookies and convert to md5:

`./PWeb.sh -pinC https://whiteboyz.xyz/md5.php?flag= -md5 SEUCOOKIE`
