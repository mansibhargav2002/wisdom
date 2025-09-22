#!/bin/sh
(
  echo "HTTP/1.1 200 OK"
  echo "Content-Type: text/plain"
  echo ""
  fortune | cowsay
)

