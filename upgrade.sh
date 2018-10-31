#!/usr/bin/env bash
helm upgrade -f ./helm/values.yaml docs-github ./helm --recreate-pods