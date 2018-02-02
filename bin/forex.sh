#!/bin/bash

YAHOO_API="https://finance.yahoo.com/webservice/v1/symbols/allcurrencies/quote?format=json"

curl -s $YAHOO_API | jq
