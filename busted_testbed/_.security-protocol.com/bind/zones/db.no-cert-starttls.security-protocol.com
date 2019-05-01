;
; BIND data file for local loopback interface
;
$TTL	1
@	IN	SOA	ns01.no-cert-starttls.security-protocol.com. admin.no-cert-starttls.security-protocol.com. (
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
ns01.no-cert-starttls.security-protocol.com.	IN	A	34.219.137.44
ns02.no-cert-starttls.security-protocol.com.	IN	A	34.219.137.44

; A record
no-cert-starttls.security-protocol.com.	IN	A	34.219.137.44

; MX record

mail.no-cert-starttls.security-protocol.com.	IN	A	34.219.137.44
@	IN	MX	10 mail.no-cert-starttls.security-protocol.com.

_25._tcp.mail.no-cert-starttls.security-protocol.com. IN TLSA 3 1 1 980d27bb6a3ee2f6b3f10a0cae5b096d8c9b1f9f21c5123be9debbdab83f0c27

; TXT for letsencrypt

_acme-challenge.no-cert-starttls.security-protocol.com. IN TXT swFXc0dyaqpWwYwbjz25tLgZR7C8MNvTc6C1lfkDN8Y

_acme-challenge.no-cert-starttls.security-protocol.com. IN TXT NVB-3IOa3Va8smV2C7zRxRqYMXFloaSz_0vsyiHGAjk
