# Containers-Rope
An implementation of ropes extracted from Bloc graphics system developed by feenk.com and probably Aliaksei Syrel.

![https://github.com/pharo-containers/Containers-Rope/actions](https://github.com/pharo-containers/Containers-Rope/workflows/Pharo9/badge.svg)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://img.shields.io/badge/license-MIT-blue.svg)
[![Coverage Status](https://coveralls.io/repos/github/pharo-containers/Containers-Rope/badge.svg?branch=master)](https://coveralls.io/github/pharo-containers/Containers-Rope?branch=master)


## Loading 
The following script installs Containers-Rope in Pharo.

```smalltalk
Metacello new
  baseline: 'ContainersRope';
  repository: 'github://pharo-containers/Containers-Rope/src';
  load.
```

## If you want to depend on it 

Add the following code to your Metacello baseline or configuration 

```smalltalk
spec 
   baseline: 'ContainersRope' 
   with: [ spec repository: 'github://pharo-containers/Containers-Rope/src' ].
```

