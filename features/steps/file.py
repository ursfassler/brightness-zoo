# (C) Copyright 2016
# Urs Fässler, bbv Software Services, http://bbv.ch
#
# SPDX-License-Identifier:	GPL-3.0+

from behave import *
import subprocess
import os

@given(u'I have a directory "{directory}"')
def step_impl(context, directory):
	os.makedirs(context.tmpdir + '/' + directory)

@given(u'I have a file "{filename}" with the content "{content}"')
def writeFileContent(context, filename, content):
	filename = context.tmpdir + '/' + filename
	file = open(filename, 'w+')
	file.write(content)
	file.close()

@given(u'I have a file "{filename}" with the content ""')
def step_impl(context, filename):
	writeFileContent(context, filename, "")

@then(u'I expect the file "{filename}" to have the content "{content}"')
def step_impl(context, filename, content):
	filename = context.tmpdir + '/' + filename
	if not os.path.isfile(filename):
		assert False, 'file not found: ' + filename

	file = open(filename, 'r')
	actualContent = file.read()
	file.close()
	assert content == actualContent, 'expected content: "' + content + '", got: "' + actualContent + '"'

@given(u'I write "{line}" to the brightnessd configuration file')
def step_impl(context, line):
	os.makedirs(context.tmpdir + '/brightness-zoo')
	filename = context.tmpdir + '/brightness-zoo/brightnessd.ini'
	file = open(filename, 'w+')
	file.write(line)
	file.close()
