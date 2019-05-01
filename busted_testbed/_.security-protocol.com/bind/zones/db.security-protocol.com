;
; BIND data file for local loopback interface
;
$TTL	1
@	IN	SOA	ns01.security-protocol.com. admin.security-protocol.com. (
			     37		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
; name servers - NS records
	IN	NS	ns01.security-protocol.com.
	IN	NS	ns02.security-protocol.com.

; name servers - A records
ns01.security-protocol.com.	IN	A	34.219.137.44
ns02.security-protocol.com.	IN	A	34.219.137.44

; A record
security-protocol.com.	IN	A	34.219.137.44

; MX record

mail.security-protocol.com.	IN	A	34.219.137.44
@	IN	MX	10 mail.security-protocol.com.

_25._tcp.mail.security-protocol.com. IN TLSA 3 1 1 746fe59913165e425f7d9605dac9323be83ee4fbabfaf3efe77db353c0805904

; TXT record for letsencrypt

_acme-challenge.security-protocol.com. IN TXT 1MrGpjKkFKYu_0IxNkHnPFPxpJRDyQtoE-VtWtMZ4nA
_acme-challenge.security-protocol.com. IN TXT GyZARAMHI9657dVYiFT_Bd1BvIIZ15Hsb7Epz44hv1A

; valid.security-protocol.com

valid.security-protocol.com.	IN	NS	ns01.security-protocol.com.
valid.security-protocol.com.	IN      NS      ns02.security-protocol.com.

valid.security-protocol.com. IN	DS 9876 10 1 6C3EFCD0C070DEA3DB5543E98A4C80F7B967C838
valid.security-protocol.com. IN	DS 9876 10 2 E9F46FDD07B1BF5035BA17F0A3612B4FF187DF3FE1EAE81D119254FE0E2ECD71

; wrong-signature.security-protocol.com

wrong-signature.security-protocol.com.	IN	NS	ns01.security-protocol.com.
wrong-signature.security-protocol.com.	IN      NS      ns02.security-protocol.com.

wrong-signature.security-protocol.com. IN DS 24351 10 1 51ACCC42AC620A578D223BC0455D137153E36661
wrong-signature.security-protocol.com. IN DS 24351 10 2 14EE94E0C1EE5974EAE3907E8124BB206B826A1CAB91E7172A8798F538393AC6

; missing-signature.security-protocol.com

missing-signature.security-protocol.com.  IN      NS      ns01.security-protocol.com.
missing-signature.security-protocol.com.  IN      NS      ns02.security-protocol.com.

missing-signature.security-protocol.com. IN DS 17178 10 1 C75E02987FC9D2A2327C21BDFF23FFCC28361905
missing-signature.security-protocol.com. IN DS 17178 10 2 F126043954C83033A1AD9EB284F33AD79ADDC4C265C6DB0F84A3E95B6208EE45

; different-cert.security-protocol.com

different-cert.security-protocol.com.  IN      NS      ns01.security-protocol.com.
different-cert.security-protocol.com.  IN      NS      ns02.security-protocol.com.

different-cert.security-protocol.com. IN DS 31182 10 1 1B8A872A164A50B3C5E91AA097D18C21C2EB2F16
different-cert.security-protocol.com. IN DS 31182 10 2 A38B497E0B2D805A3DACF89708CCFDADD6976D6E5D465C6701809AB15DE7850B

; no-cert.security-protocol.com

no-cert-starttls.security-protocol.com.  IN      NS      ns01.security-protocol.com.
no-cert-starttls.security-protocol.com.  IN      NS      ns02.security-protocol.com.

no-cert-starttls.security-protocol.com.	IN DS 29079 10 1 99A9DEBD61146AA84B661BEF938095FD06461A29
no-cert-starttls.security-protocol.com.	IN DS 29079 10 2 DD89AB3494472CB1D7A35AD6273A4377631DE46A30469F5D04C6D0352156008B

; dane-diff-usage.security-protocol.com

dane-diff-usage.security-protocol.com.  IN      NS      ns01.security-protocol.com.
dane-diff-usage.security-protocol.com.  IN      NS      ns02.security-protocol.com.

dane-diff-usage.security-protocol.com. IN DS 38 10 1 F217A697823E5F7484CEC2D6291A439BD5BD5994
dane-diff-usage.security-protocol.com. IN DS 38 10 2 67D3FA8D19336ED0BFDD1D8D00A498853DB3E621726EBAB7D178C1EF511E6948

; missing-ds.security-protocol.com

missing-ds.security-protocol.com.	IN	NS	ns01.security-protocol.com.	
missing-ds.security-protocol.com.	IN	NS	ns02.security-protocol.com.

; dane-diff-selector.security-protocol.com.

dane-diff-selector.security-protocol.com. IN	NS	ns01.security-protocol.com.
dane-diff-selector.security-protocol.com. IN    NS      ns02.security-protocol.com.

dane-diff-selector.security-protocol.com. IN DS 34164 10 1 12B7A1CAB6CB5174EBE9CED5E402215208748E9A
dane-diff-selector.security-protocol.com. IN DS 34164 10 2 692111985835556F0C3666F9F08FECECF7531A2591503D3AD0A6EE196B355089
