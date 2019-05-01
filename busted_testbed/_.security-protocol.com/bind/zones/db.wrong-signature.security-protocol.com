;
; BIND data file for local loopback interface
;
$TTL	1
@	IN	SOA	ns01.wrong-signature.security-protocol.com. admin.wrong-signature.security-protocol.com. (
			     18		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
; name servers - NS records
	IN	NS	ns01.security-protocol.com.
	IN	NS	ns02.security-protocol.com.

; name servers - A records
ns01.wrong-signature.security-protocol.com.	IN	A	34.219.137.44
ns02.wrong-signature.security-protocol.com.	IN	A	34.219.137.44

; A record
wrong-signature.security-protocol.com.	IN	A	34.219.137.44

; MX record

mail.wrong-signature.security-protocol.com.	IN	A	34.219.137.44
@	IN	MX	10 mail.wrong-signature.security-protocol.com.

_25._tcp.mail.wrong-signature.security-protocol.com. IN TLSA 3 1 1 627901b0b462c21881f3077369436c8bda2a7e9ac50d54508cef45b10b8e758e

; TXT for letsencrypt

_acme-challenge.wrong-signature.security-protocol.com. IN TXT 5_BN4IuTelcALbeG0XGS6CmW_i6OY1whk4rrRH4Qrd4

_acme-challenge.wrong-signature.security-protocol.com. IN TXT 5J-27_N4jy2_OX2zzDsGyeeS_Tbk1oZ_1MpdTyruTmk
