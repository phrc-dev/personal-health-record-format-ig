// mimetype (IANA Media Types) の CodeSystem。
// FHIRコア仕様の DocumentReference.content.attachment.contentType は
// ValueSet http://hl7.org/fhir/ValueSet/mimetypes に required束縛されており、
// その中身は system=urn:ietf:bcp:13 を include している（コード列挙なし）。
// urn:ietf:bcp:13 は IANA 管理の動的リストで、FHIR配布パッケージに実体が無いため、
// 外部用語サーバー(tx.fhir.org)に繋がない(-tx n/a)環境ではこのsystemを解決できず、
// 正しいmimetype値でも「system could not be found」→required違反でerrorになる。
// 対策として、本PHRで使用するmimetypeを列挙した CodeSystem を url=urn:ietf:bcp:13 で
// content=complete として定義し、validator がローカルでこのsystemを解決できるようにする。
// これにより -tx n/a のまま mimetype 検証を維持できる（外部依存なし）。
CodeSystem: Bcp13MimeTypeCS
Id: bcp13-mimetype-cs
Description: "IANA Media Types (urn:ietf:bcp:13) の内、本PHRで使用するmimetypeを列挙したCodeSystem。-tx n/a環境でmimetype検証をローカル化するために定義する。"
* ^url = "urn:ietf:bcp:13"
* ^title = "BCP 13 MIME Types (PHR subset)"
* ^version = "1.0.0"
* ^status = #active
* ^content = #complete
* ^caseSensitive = true
* ^experimental = true

* #application/json "application/json"
* #application/pdf "application/pdf"
* #application/xml "application/xml"
* #text/xml "text/xml"
* #image/jpeg "image/jpeg"
* #image/png "image/png"
* #application/octet-stream "application/octet-stream"
* #x-application/hl7-v2+er7 "x-application/hl7-v2+er7"
