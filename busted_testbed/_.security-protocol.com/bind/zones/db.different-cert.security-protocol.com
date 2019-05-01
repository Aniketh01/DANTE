;
; BIND data file for local loopback interface
;
$TTL	1
@	IN	SOA	ns01.different-cert.security-protocol.com. admin.different-cert.security-protocol.com. (
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
ns01.different-cert.security-protocol.com.	IN	A	34.219.137.44
ns02.different-cert.security-protocol.com.	IN	A	34.219.137.44

; A record
different-cert.security-protocol.com.	IN	A	34.219.137.44

; MX record

mail.different-cert.security-protocol.com.	IN	A	34.219.137.44
@	IN	MX	10 mail.different-cert.security-protocol.com.

_25._tcp.mail.different-cert.security-protocol.com. IN TLSA 3 1 1 b7ce50c4b2523940e12fa3d66da3e71112a842e0dcb9788fc608887aab6d7cf0

; TXT record for letsencrypt

_acme-challenge.different-cert.security-protocol.com. IN TXT KFwRp6AeGH12WX2bsptN6310NaEOuYLRjd_mie_qv_g

_acme-challenge.different-cert.security-protocol.com. IN TXT mSkm5JOEAbJlRGlNxnEuAvNWoUZ7jNKv8E7h4Y69jg0
