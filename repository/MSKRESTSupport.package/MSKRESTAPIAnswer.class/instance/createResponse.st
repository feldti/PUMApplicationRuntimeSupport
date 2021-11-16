finishing
createResponse

	response entity:  (ZnEntity with: (NeoJSONWriter toString: self  using: self jsonSerializeMessage) type: (self responseType ifNil:[ ZnMimeType applicationJsonUTF8 ])).