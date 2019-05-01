;
; BIND data file for local loopback interface
;
$TTL	1
@	IN	SOA	ns01.valid.security-protocol.com. admin.valid.security-protocol.com. (
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
ns01.valid.security-protocol.com.	IN	A	34.219.137.44
ns02.valid.security-protocol.com.	IN	A	34.219.137.44

; A record
valid.security-protocol.com.	IN	A	34.219.137.44

; MX record

mail.valid.security-protocol.com.	IN	A	34.219.137.44
@	IN	MX	10 mail.valid.security-protocol.com.

_25._tcp.mail.valid.security-protocol.com. IN TLSA 3 1 1 2caf3a36c178574ebf9636689001be5a65facb09d129dcbd580d44a9e9db6ff1

; TXT for letsencrypt

_acme-challenge.valid.security-protocol.com. IN TXT JFjuTQVHBKrv0jeZj3tx9TgC9cdrUnEjgyhQCGEST5A

_acme-challenge.valid.security-protocol.com. IN TXT 3k-eZWIlNwKWI0Jif3rqyNW44qt491CYBJ33aFDniHk
