# PatternBuffer

PatternBuffer is an experimental implementation of the [Distributed OSHW Framework (dof)](https://mach30.github.io/dof/).

## Loading instructions

### Starting from a Pharo image

Open a playground window (`Ctrl+O+W`) and evaluate:

```smalltalk
Metacello new baseline: 'PatternBuffer';
    repository: 'github://capsulecorplab/patternbuffer:main/src';
    load.
```

Note: Evaluate by highlighting the text, then either right-click on the highlighted text and click `Do it` or press `Ctrl+D`.

### Starting from the shell

Clone the repo:

```shell
git clone https://github.com/capsulecorplab/patternbuffer.git
cd PatternBuffer
```

Download the 64-bit Pharo image + VM into the `PatternBuffer` directory and start the Pharo-UI:

```shell
curl get.pharo.org/64/stable+vm | bash
./pharo-ui
```

In the Pharo-UI, open a playground window (`Ctrl+O+W`) and evaluate:

```smalltalk
Metacello new baseline: 'PatternBuffer';
   repository: 'gitlocal://./src';
   load.
```

Note: Evaluate by highlighting the text, then either right-click on the highlighted text and click `Do it` or press `Ctrl+D`.

## Example Usage

Once the `PatternBuffer` package has been loaded into your Pharo image, you can define a `Component` & `Interface` in a playground window:

```smalltalk
warpcore := Component new
	name: 'warp core';
	description: 'powers propulsion system for a warp-capable starship';
	ports: {(Port new name: 'warp core port')}.

warpnacelle := Component new
	name: 'warp nacelle';
	description: 'propulsion system for a warp-capable starship';
	ports: {(Port new name: 'warp nacelle port')}.

warpconduit := Interface new
	name: 'warp conduit';
	description: 'transfers warp field energy from the warp core to warp nacelles';
	data: 'warp field energy';
	ports:
		{(warpcore ports at: 1).
		(warpnacelle ports at: 1)}.

(warpconduit ports at: 1) name ">> warp core port"
(warpconduit ports at: 2) name ">> warp nacelle port"
```
