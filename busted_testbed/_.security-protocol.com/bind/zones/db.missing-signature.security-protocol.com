;
; BIND data file for local loopback interface
;
$TTL	1
@	IN	SOA	ns01.missing-signature.security-protocol.com. admin.missing-signature.security-protocol.com. (
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
ns01.missing-signature.security-protocol.com.	IN	A	34.219.137.44
ns02.missing-signature.security-protocol.com.	IN	A	34.219.137.44

; A record
missing-signature.security-protocol.com.	IN	A	34.219.137.44

; MX record

mail.missing-signature.security-protocol.com.	IN	A	34.219.137.44
@	IN	MX	10 mail.missing-signature.security-protocol.com.

_25._tcp.mail.missing-signature.security-protocol.com. IN TLSA 3 1 1 f3bea65c5c1dc35c284e30e58cbf4e6778dd37bac3100eeb6a92cb4e0382c595

; TXT for letsencrypt

_acme-challenge.missing-signature.security-protocol.com. IN TXT PQFJShi5gszlmkhG1NJdPTpQbbIHIyJcBelEWcXcSZQ

_acme-challenge.missing-signature.security-protocol.com. IN TXT rUkP-YCoMurkeq9PjWiNZoixIWijgIaYdUaFA9fncIA 
