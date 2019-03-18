;
; BIND data file for local loopback interface
;
$TTL	1
@	IN	SOA	ns01.security-protocol.com. admin.security-protocol.com. (
			      5		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
; name servers - NS records
	IN	NS	ns01.security-protocol.com.
	IN	NS	ns02.security-protocol.com.

; name servers - A records
ns01.security-protocol.com.	IN	A	34.221.70.48
ns02.security-protocol.com.	IN	A	34.221.70.48

; A record
security-protocol.com.	IN	A	34.221.70.48

; MX record

mail.security-protocol.com.	IN	A	34.221.70.48
@	IN	MX	10 mail.security-protocol.com.

_25._tcp.mail.security-protocol.com. IN TLSA 3 1 1 (38717199daf95d9d58a5004cc6fcc3fa89abe696cb57100e5fa018c4bab5543c)
