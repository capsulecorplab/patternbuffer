# PatternBuffer

PatternBuffer is a Pharo/Smalltalk client for querying RDF databases.

## Loading instructions

### Starting from a Pharo image

Open a playground window (`Ctrl+O+W`) and evaluate:

```smalltalk
Metacello new baseline: 'PatternBuffer';
    repository: 'github://capsulecorplab/patternbuffer:main';
    load.
```

Note: Evaluate by highlighting the text, then either right-click on the highlighted text and click `Do it` or press `Ctrl+D`.

### Starting from the shell

Clone the repo:

```shell
git clone https://github.com/capsulecorplab/patternbuffer.git
cd patternbuffer
```

Download the 64-bit Pharo image + VM into the `patternbuffer` directory and start the Pharo-UI:

```shell
curl get.pharo.org/64/stable+vm | bash
./pharo-ui Pharo.image
```

In the Pharo-UI, open a playground window (`Ctrl+O+W`) and evaluate:

```smalltalk
Metacello new baseline: 'PatternBuffer';
   repository: 'gitlocal://./src';
   load.
```

Note: Evaluate by highlighting the text, then either right-click on the highlighted text and click `Do it` or press `Ctrl+D`.

## Example Usage

Once the `PatternBuffer` package has been loaded into your Pharo image, you can run a query against a SPARQL endpoint.
For example, the following returns a JSON object of assemblies & subassemblies from the [firesat](https://github.com/opencaesar/firesat-example) database running on a local server:

```smalltalk
PBSPARQL new
    endpoint: 'http://localhost:3030/firesat/sparql';
    query: 'PREFIX fse:   <http://opencaesar.io/examples/firesat/disciplines/fse/fse#>
PREFIX base:   <http://imce.jpl.nasa.gov/foundation/base#>

SELECT ?assembly ?subassembly

WHERE {
	?assembly base:contains ?subassembly
}'; resultAsJSON.
```

