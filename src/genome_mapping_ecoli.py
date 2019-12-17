rosebecter = {
    'Escherichia_coli_11368.aln':'A',
    'Escherichia_coli_2011C-3493.aln':'B',
    'Escherichia_coli_2013C-4538.aln':'C',
    'Escherichia_coli_2015C-4944.aln':'D',
    'Escherichia_coli_644-PT8.aln':'E',
    'Escherichia_coli_97-3250.aln':'F',
    'Escherichia_coli_ATCC_11775.aln':'G',
    'Escherichia_coli_CFSAN027343.aln':'H',
    'Escherichia_coli_FORC_028.aln':'I',
    'Escherichia_coli_FRIK944.aln':'J',
    'Escherichia_coli_FWSEC0001.aln':'K',
    'Escherichia_coli_IAI39.aln':'L',
    'Escherichia_coli_MG1655.aln':'M',
    'Escherichia_coli_NRG_857C.aln':'N',
    'Escherichia_coli_O157H7.aln':'O',
    'Escherichia_coli_RM10386.aln':'P',
    'Escherichia_coli_UMN026.aln':'Q'
}




if __name__=="__main__":
    file = open('../data/ecoli_100000_read_length_110.txt','r')
    file_replaced_tree = open('../data/ecoli_100000_read_length_110_mapping.txt','a+')
    for line in file:
        for key in rosebecter.keys():
            line = line.replace(key, rosebecter.get(key))

        file_replaced_tree.write('{}\n'.format(line))
    file_replaced_tree.close()
    file.close()

