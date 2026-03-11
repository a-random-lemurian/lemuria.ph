---
title: "{{ replace .Name "-" " " | title }}"
date: {{ .Date }}
draft: true
author: Lemuria
slug: "{{ .Name | replaceRE `^[0-9]{4}-[0-9]{2}-[0-9]{2}-` "" | urlize }}"
---
