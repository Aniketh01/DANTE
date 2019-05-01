;
; BIND data file for local loopback interface
;
$TTL	1
@	IN	SOA	ns01.dane-diff-usage.security-protocol.com. admin.dane-diff-usage.security-protocol.com. (
			     22		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
; name servers - NS records
	IN	NS	ns01.security-protocol.com.
	IN	NS	ns02.security-protocol.com.

; name servers - A records
ns01.dane-diff-usage.security-protocol.com.	IN	A	34.219.137.44
ns02.dane-diff-usage.security-protocol.com.	IN	A	34.219.137.44

; A record
dane-diff-usage.security-protocol.com.	IN	A	34.219.137.44

; MX record

mail.dane-diff-usage.security-protocol.com.	IN	A	34.219.137.44
@	IN	MX	10 mail.dane-diff-usage.security-protocol.com.

_25._tcp.mail.dane-diff-usage.security-protocol.com. IN TLSA 1 1 1 a67d2c834a4ca84270e6e63c91efe8c0d80f587dd54ee7b3961d91a0ed8f8012

; TXT record for letsencrypt

_acme-challenge.dane-diff-usage.security-protocol.com. IN TXT -XrTI8px1dvyVjOOHXIJbdqHYsEut4HPJQao3pwqPNM

_acme-challenge.dane-diff-usage.security-protocol.com. IN TXT l-VMsONzvQvSfgvmIPUaffEfoV6NiY7QCh5mJQ0TfJU
