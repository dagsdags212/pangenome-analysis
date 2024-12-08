# ASFV Pangenome Analysis

### Goal

Create and compare the phylogenetic trees produces from:

1. Whole genome alignment: provides the most comprehensive view
2. _B646L_ (p72) gene alignment: most common gene used for genotyping
3. _B602L_ (CVR) gene alignment: a 400bp region within the relatively conserved central 125-kb region
4. _E183L_ (p54) gene: used as an auxiliary index


### TODO

- [ ] Retrieve all ASFV assemblies from NCBI
- [ ] Data processing
- [ ] Run phylogenetic inference
- [ ] Identify polymorphisms and structural variants
- [ ] Subset the genome and create a pangenome


### Workflow

1. Retrieve all ASFV assemblies from NCBI

- the initial search was conducted by passing in "African swine fever virus" as the `-query` parameter of the `esearch` tool
- a total of of **348** genomes were retrieved on December 5, 2024
- the genome, cds, and annotation files were included in the download

2. Data processing

- filter for the following gene sequences using `bedtools` and save as a FASTA file:
    + _B646L_
    + _B602L_
    + _E183L_

3. Run phylogenetic inference

- construct a tree using the whole genome alignment, as well as the three other genes used to genotype ASFV
- visualize tree using ggtree

4. Identify polymorphisms and structural variants

- conduct variant calling to the whole genome alignment

5. Subset the genome and create a pangenome

- subsetted data must include at least one representative from each produced clade
