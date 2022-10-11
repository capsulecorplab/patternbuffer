# PatternBuffer

PatternBuffer is a Pharo/Smalltalk client for querying RDF databases.

## Loading instructions

### Starting from a Pharo image

To load the latest release, open a playground window (`Ctrl+O+W`) and evaluate:

```smalltalk
Metacello new baseline: 'PatternBuffer';
    repository: 'github://capsulecorplab/patternbuffer:v0.3.0';
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

Once the `PatternBuffer` package has been loaded into your Pharo image, you can run a SPARQL query against an RDF datastore.
For example, the following executes a query for assemblies & subassemblies against a TTL file downloaded from the [firesat](https://github.com/opencaesar/firesat-example) database:

```smalltalk
firesatClient := PBSPARQL new
    datastore: '/home/kasm-user/firesat-example/firesat.ttl';
    query: 'PREFIX fse:   <http://opencaesar.io/examples/firesat/disciplines/fse/fse#>
PREFIX base:   <http://imce.jpl.nasa.gov/foundation/base#>

SELECT ?assembly ?subassembly

WHERE {
	?assembly base:contains ?subassembly
}'.
```

Results of the SPARQL query can be viewed as a JSON object,

```smalltalk
firesatClient resultAsJSON.
```

or as a table,

```smalltalk
firesatClient resultAsTable.
```

