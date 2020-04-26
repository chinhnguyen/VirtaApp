generate-sdk:
	openapi-generator generate -i swagger.yaml -g swift4 -o VirtaSdk --additional-properties projectName=VirtaSdk,responseAs=Result,swiftUseApiNamespace=true