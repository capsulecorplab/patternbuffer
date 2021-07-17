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

Once the `PatternBuffer` package has been loaded into your Pharo image, you can create a `Component` in a playground window:

```smalltalk
ncc1701 := Component new
    name: 'Constitution class starship';
    description: 'Federation starship, designed for five-year missions in deep space'.
```
