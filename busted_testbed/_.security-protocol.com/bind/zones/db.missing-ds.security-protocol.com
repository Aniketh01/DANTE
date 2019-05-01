;
; BIND data file for local loopback interface
;
$TTL	1
@	IN	SOA	ns01.missing-ds.security-protocol.com. admin.missing-ds.security-protocol.com. (
			     19		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
; name servers - NS records
	IN	NS	ns01.security-protocol.com.
	IN	NS	ns02.security-protocol.com.

; name servers - A records
ns01.missing-ds.security-protocol.com.	IN	A	34.219.137.44
ns02.missing-ds.security-protocol.com.	IN	A	34.219.137.44

; A record
missing-ds.security-protocol.com.	IN	A	34.219.137.44

; MX record

mail.missing-ds.security-protocol.com.	IN	A	34.219.137.44
@	IN	MX	10 mail.missing-ds.security-protocol.com.

_25._tcp.mail.missing-ds.security-protocol.com. IN TLSA 3 1 1 9bf119be0d024941e419bcef9dfd5c52cc85b3eccd30c467a1b8ece98424cb53

; TXT record for letsencrypt

_acme-challenge.missing-ds.security-protocol.com. IN TXT Ys-E-XdSIXiP8D1TESJdcW0xqSD2GiEp1vEAWrDdR4I

_acme-challenge.missing-ds.security-protocol.com. IN TXT kOoNJbFXce8yEyLhglAXH8NXR4f-4ncqWT9aPws_FmQ
