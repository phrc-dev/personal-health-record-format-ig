// mimetype (IANA Media Types) の CodeSystem。
// FHIRコア仕様の DocumentReference.content.attachment.contentType は
// ValueSet http://hl7.org/fhir/ValueSet/mimetypes に required束縛されており、
// その中身は system=urn:ietf:bcp:13 を include している（コード列挙なし）。
// urn:ietf:bcp:13 は IANA 管理の動的リストで、FHIR配布パッケージに実体が同梱されていない。
// このため validator はこの system の実体を持たず、正しいmimetype値でも
// 「system could not be found」→ required束縛違反で error を返す（実測・再現性100%）。
// 対策として、本PHRで使用するmimetypeを列挙した CodeSystem を url=urn:ietf:bcp:13 で
// content=complete として定義し、validator がローカルでこの system を解決できるようにする。
// これにより DA04収集の mimetype 検証が error 0 で通る。
CodeSystem: Bcp13MimeTypeCS
Id: bcp13-mimetype-cs
Description: "IANA Media Types (urn:ietf:bcp:13) の内、本PHRで使用するmimetypeを列挙したCodeSystem。validator が DocumentReference.content.attachment.contentType の mimetype 検証をローカルで解決できるようにするために定義する。"
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
