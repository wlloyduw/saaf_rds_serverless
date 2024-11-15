/7
#!/bin/bash

# JSON object to pass to Lambda Function
json={"\"name\"":"\"Susan\u0020Smith\",\"param1\"":1,\"param2\"":2,\"param3\"":3}

#echo "Invoking Lambda function using API Gateway"
#time output=`curl -s -H "Content-Type: application/json" -X POST -d $json {API-GATEWAY-REST-URL}`
#echo ""

#echo ""
#echo "JSON RESULT:"
#echo $output | jq
#echo ""

echo "Invoking Lambda function using AWS CLI"
time output=`aws lambda invoke --invocation-type RequestResponse --cli-binary-format raw-in-base64-out --function-name LAMBDA-FUNCTION-NAME --region us-east-1 --payload $json /dev/stdout | head -n 1 | head -c -2 ; echo`

echo ""
echo "JSON RESULT:"
echo $output | jq
echo ""
