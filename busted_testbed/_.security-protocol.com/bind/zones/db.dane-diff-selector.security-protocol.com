;
; BIND data file for local loopback interface
;
$TTL	1
@	IN	SOA	ns01.dane-diff-selector.security-protocol.com. admin.dane-diff-selector.security-protocol.com. (
			     30		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
; name servers - NS records
	IN	NS	ns01.security-protocol.com.
	IN	NS	ns02.security-protocol.com.

; name servers - A records
ns01.dane-diff-selector.security-protocol.com.	IN	A	34.219.137.44
ns02.dane-diff-selector.security-protocol.com.	IN	A	34.219.137.44

; A record
dane-diff-selector.security-protocol.com.	IN	A	34.219.137.44

; MX record

mail.dane-diff-selector.security-protocol.com.	IN	A	34.219.137.44
@	IN	MX	10 mail.dane-diff-selector.security-protocol.com.

_25._tcp.mail.dane-diff-selector.security-protocol.com. IN TLSA 3 0 1 67688ee397899ba31a97fd1693162c810fdab05906b2ac2ea9516b655942f012

; TXT record for letsencrypt

_acme-challenge.dane-diff-selector.security-protocol.com. IN TXT YAcu7LI_zvnFXUQuHUevhZhHrfeVMLie6EBFlBp5Y7s

_acme-challenge.dane-diff-selector.security-protocol.com. IN TXT RSwNS_YGN1AtybP4g0U4kQxj1F74aLfQQDQGxwteOAI
