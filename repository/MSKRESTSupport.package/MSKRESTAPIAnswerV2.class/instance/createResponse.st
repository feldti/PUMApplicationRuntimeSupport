action
createResponse

	response entity:  (ZnEntity with: (NeoJSONWriter toString: self resultModel) type: (self responseType ifNil:[ ZnMimeType applicationJsonUTF8 ])).