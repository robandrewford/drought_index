rule targets:
    input:
        "data/ghcnd_all.tar.gz",
        "data/ghcnd_all_files.txt",
        "data/ghcnd-inventory.txt",
        "data/ghcnd-stations.txt"

rule get_all_archive:
    input: 
        script = "code/get_ghcnd_data.bash"
    output:
        "data/ghcnd_all.tar.gz"
    params:
        file = "ghcnd_all.tar.gz"
    shell:
        """
        {input.script} {params.file}
        """

rule get_all_filenames:
    input: 
        script = "code/get_ghcnd_all_files.bash",
        archive = "data/ghcnd_all.tar.gz"
    output:
        "data/ghcnd_all_files.txt"
    shell:
        "{input.script}"


# snakemake --dry-run get_all_archive
# snakemake -np get_all_filenames
# snakemake -np (run the first rule, which triggers the rest)
# snakemake -c 1 (one core)

rule get_inventory:
    input: 
        script = "code/get_ghcnd_data.bash"
    output:
        "data/ghcnd-inventory.txt"
    params:
        file = "ghcnd-inventory.txt"
    shell:
        """
        {input.script} {params.file}
        """

rule get_stations:
    input:
        script = "code/get_ghcnd_data.bash"
    output:
        "data/ghcnd-stations.txt"
    params:
        file = "ghcnd-stations.txt"
    shell:
        """
        {input.script} {params.file}
        """
rule save_dag:
    input:
       script = "" 