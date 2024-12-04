---
title: Pangenome Analysis of ASFV
short_title: Pangenome Analysis
description: Building a graph representation of the mutational landscape of ASFV 
license:
    content: CC-BY-SA-3.0
keywords:
    - pangenome
    - african swine fever virus
    - graph assembly
export:
  - format: pdf
    template: lapreprint
---

```{admonition}
This article was written as part of the course requirements for BIOINFO 221.
```

+++ { "part": "abstract" }

In Progress...

+++ { "part": "introduction" }

# Introduction

Over the last two decades, whole genome sequencing (WGS) has become an indispensible tool in infectious disease research, surveillance, and control (@doi:10.1038/nrg3226; @doi:10.1038/nrg.2017.88). Rapid advancements in sequencing technologies and bioinformatics analysis have facilitated the generation of high-quality genomic data at an unprecented scale. WGS has enabled researches to track and monitor the spread and evolution of pathogens, investigate outbreaks, identify drug resistance markers, and develop diagnostic assays and vaccines. Its utility has been especially evident in the SARS-CoV-2 pandemic, enabling real-time tracking of the pandemic and identification of transmission chains. Additionally, WGS has provided valuable insights into the genetic diversity, population structure, and functional characteristics of various pathogens, thereby shaping our understanding of the molecular mechanisms driving their virulence and transmission.
:width: 80%

+++ { "part": "concepts" }


## African Swine Fever Virus

### Genome 

The African Swine Fever virus (ASFV) is a 200 nm diameter icosahedral DNA virus comprising an envelope, capsid, inner capsule, membrane, core shell, and inner core. The viral genome is a linear, 170-190 kb long double-stranded DNA molecule with covalently closed ends. It can be divided into the left variable region (LVR, 38-48kb), central conserved region (C region, about 125kb), and the right variable region (RVR, 13-22kb). 

:::{figure} https://journals.asm.org/cms/10.1128/jvi.00119-20/asset/d78318e4-89dc-45f7-8efa-3373eadf18c3/assets/graphic/jvi.00119-20-f0001.jpeg
:label: asfv-annotated-genome
:width: 80%
:align: center

Annotated genome of ASFV indicating transcription start sites (TSS) and early and late genes [@doi:10.1128/jvi.00119-20].
:::

It encodes 150-200 viral proteins, 68 of which are structural proteins. P72 is a major capsid protein commonly used to genotype viral strains due to its conservativeness. However, @doi:10.3201/eid2102.140649 suggests that P72 phylogenetic analysis does not accurately define ASFV hemadsorption inhibition assay (HAI) serogroups. The variation in genome size is due to the repeat and loss of certain genomic sequences across strains. 

:::{figure} https://www.frontiersin.org/files/Articles/715582/fimmu-12-715582-HTML-r1/image_m/fimmu-12-715582-g001.jpg
:label: asfv-structure
:width: 80%
:align: center

The ASFV structure.
:::

ASFV can be classified into 24 genotypes on the basis of the _B646L_ gene and into 8 serotypes on the basis of anti-body mediated hemadsorption inhibition. Serotypes are based on phylogenetic grouping of the CD2v viral protein encoded by the _EP402R_ gene. These methods allow relatively fast and easy typing of ASFV strains, and remain the first approach for identification of the origin of ASFV in case of introduction into new territories.

### Transmission

The first case of African swine fever was reported in 1921 and ever since, ASFV has escaped from the African continent and spread dramatically. In 2007, ASFV was introduced into Georgia and further spread to the Trans-Caucasian region until it reached Russia and neighboring members of the European Union in 2014. In 2018, the virus crossed the border of China which is currently the world's larget pig produced. Now, it is spread across Southeast Asian countries, causing a major epidemic in countries such as Vietnam and the Philippines. Currently, there is no commercial vaccine avaialble for control of ASFV tranmission.

### Variation

<!-- expound of multi-gene familiy (MGF) variation -->

ASFV has an estimated substitution rate $\mu \approx 6.7 \times 10^{-4}$ [@doi:10.1371/journal.pone.0069662] which is lower compared to RNA viruses such as the influenza virus with $\mu \approx 10^{-3}$ [@doi:10.1093/molbev/msh109], but higher compared to other large dsDNA viruses such as herpes simplex type I virus with $\mu \approx 10^{-5}$ [@doi:10.1038/nrg2323]. The high substitution rates may indicate a high level of variability in the central region which was thought to be conserved. This high level of variability may have important implications for understanding the puzzling adaptive capability and host range of ASFV under the context of evolutionary adaptation.

## Pangenomes

### Definition

Pangenomes represent the genetic variation naturally found within populations. They may be **gene-oriented** and model the presence and absence of genes within the population, or they may be **sequence-oriented** and focus on the variation of genomic sequences including single nucleotide variants, insertions, deletions, and structural variants for the given population ([Matthews et al., 2024](10.1093/bib/bbae588)). Pangenomes have emerged in response to limitations associated with traditional linear reference genomes that are usually assembled from a single individual. They carry less bias since they do not rely on a single linear reference genome and can be useful in applications such as species delineation, variant identification, genotyping, phenotyping, and inferring the haplotypes of newly sequences samples.

```{figure} https://oup.silverchair-cdn.com/oup/backfile/Content_public/Journal/bib/25/6/10.1093_bib_bbae588/1/m_bbae588f1.jpeg?Expires=1735233950&Signature=L-ysUagG2iD8k6Y2yzyYHiAUvV~2vAi8gAlgBJy292MqrF6kTQBpsvIueqqaWtSEEY-WPnmXtpilEeyB8Fne~f8mLYJ4UzTsCTc73JDMIbSTxvifpsAQtulj8m~2TK-ut41OIGReL8wFXW11FmN5~Ar0tA9jjGqUHBEYUJyjGWymrlFwGECN5sAA2M2JQGnHhdKsyZtCBLCfaNidabHvlT0UgbAOxmAWXcmANvXH2OlZX3NG97qF-An8hxw1UI~Ucg1S1aDbpn510-jjaSUM-vlt5B9tq3pV6IsqrNXeB23d2QOsthusav-fe9zOmSRz4y78WltgABVCU7PlwTEuIw__&Key-Pair-Id=APKAIE5G5CRDK6RD3PGA
:label: traditional-vs-pangenome-assembly
:align: center

Comparison of a traditional reference approach (left) with a pangennomic approach (right).
```

Many bioinformatics analyses make comparisons between sequenced reads from a new sample and a reference sequence through the process of read alignment. If the reference does not contain a subsequence that is sufficiently similar to the sample sequence, reads from the sample sequence will align poorly or won't align at all. This is a source of error known as reference bias. As a result, unaligned reads are not included in downstream analysis which may have a significant impact on research findings. Pangenomics provides a solution to this problem by representing that natural genomic variation within a species.

### Types of pangenomes

Presence-absence variation pangenome
: Composed of a core genome and an accessory genome. The core genome is the full set of genes present in every member of a population, while the accessory genome is composed of genes present only in a subset of the population.

Representative sequence pangenome
: Composed of carefully selected genomic sequences so that as much genomic variation from the population is represented in as little sequence as possible.

Pangenome graph
: Either **sequence-oriented** (models genomic sequence variation as well as its relative position) or **gene-oriented** (models genes found within the population and their gene order).

```{figure} https://oup.silverchair-cdn.com/oup/backfile/Content_public/Journal/bib/25/6/10.1093_bib_bbae588/1/m_bbae588f2.jpeg?Expires=1735233950&Signature=mjgOT33tqxWcr4gYsNSusXeNfiEEnb5ADwveADIPW9NZQ45L5ew7P-qahVMa-7H6jiPQhrJBXAs5k1AfriOPpv2PygTPHv9zZdwGHWgKP4dLhc9RTVGTkjU1ETDBsqNk13uYGsSnMt12VW85EJh5Yx1C-kYeQ58TzpGMESTpMN3hUBNnKpJhSf8lul8MpSqRBo5pIIYM~jEdyroDf0MbgSTPNEA0JPPNOQavOCnfCr8GOEqtg6KOIHhNJqz9PxuvQEUncBindIVSxaXS3MTI-Afy9qBJ3P7-w982N0Mf7LaFWE9uvYAjktwAzNjckbNMQDuPWACmYvK13TMJOT-hiQ__&Key-Pair-Id=APKAIE5G5CRDK6RD3PGA
:label: pangenome-types
:align: center

Three types of pangenomic data structures.
```

### Construction

::::{grid}
:::{card}
:header: **PAV Pangenome**

- homologue-base strategy
- map-to-pan strategy
:::

:::{card}
:header: **Representative sequence**
:footer: involves unaligned reads

- metagenome-like assembly
- independent assembly
- iterative assembly
- independent whole-genome assembly
:::

:::{card}
:header: **Pangenome graph**

- predetermined variants
- multiple sequence alignment
- de Bruijn graphs
:::
::::


+++ { "part": "methods" }

# Methods

:::{figure} https://www.frontiersin.org/files/Articles/1225248/fgene-14-1225248-HTML-r1/image_m/fgene-14-1225248-g001.jpg
:label: workflow
:width: 80%
:align: center

Overview of the pangenome graph workflow
:::

## Retrieval of ASFV assemblies

## Alignment of ASFV genomes

## Simulation of genomes for pangenome graph construction

## Pangenome graph construction with PGGB

+++ { "part": "results" }

# Results

In Progress...

# Supplementary Information

::::{note} Glossary
:::{glossary}
Accessory genome
: a set of genes that are present in only one or some members of a population

Core genome
: a set of genes that are present within all members of a population.

Gene-oriented pangenome
: a pangenome modelling differences within a population at the gene level.

Homologue strategy
: multiple genomes from the population are annotated, and gene sequences are extracted from these annotations and are clustered by sequence similarity into gene clusters; the presence of absence of a gene in a sample is determined by whether or not that sample contributes to that gene cluster.

Map-to-pan strategy
: determination of gene presence through interrogation of sample read coverage of genes.

Pangenome
: genomic data from multiple members of a species or other population with some underlyding structure.

Pangenome graph
: a pangenome that is represented using a mathematical graph structure composed of nodes and edges that gives positional context to sequence variation between different genomic sequences.

Population
: a group of organisms that may benefit from genomic comparison, for example, a specific tissue, species, phylogenetic clade, or ecological community.

Presence-absence variation pangenome
: a collection of all the genes found within a population that is divided into a core genome and an accessory genome based on gene patterns of presence and absence within the population.

Representative sequence pangenome
: a collectiton of genomic sequences that, together, represent the majority of natural sequence variation within a population.

Sequence-oriented pangenome
: a pangenome modelling differences within a population at the sequence or nucleotide level.
:::
::::
