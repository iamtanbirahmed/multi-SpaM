rosebecter = {
    'Dinoroseobacter_shibae_12.aln':'D12',
    'Jannaschia_CCS1.aln':'CCS1',
    'Loktanella_vestfoldensis_SMR4r.aln':'SMR4r',
    'Phaeobacter_inhibens_17395.aln':'PI17395',
    'Phaeobacter_inhibens_2.10.aln':'PI210',
    'Phaeobacter_inhibens_BS107.aln':'BS107',
    'Phaeobacter_inhibens_DOK1-1.aln':'DOK',
    'Phaeobacter_inhibens_P10.aln':'P10',
    'Phaeobacter_inhibens_P66.aln':'P66',
    'Phaeobacter_inhibens_P72.aln':'P72',
    'Phaeobacter_inhibens_P80.aln':'P80',
    'Phaeobacter_inhibens_P83.aln':'P83',
    'Phaeobacter_inhibens_P88.aln':'P88',
    'Roseobacter_denitrificans_114.aln':'RD114',
    'Roseobacter_denitrificans_FDAARGOS_309.aln':'RD309',
    'Roseobacter_litoralis_149.aln':'RL149',
    'Roseovarius_AK1035.aln':'AK1035',
    'Roseovarius_THAF27.aln':'THAF27',
    'Roseovarius_THAF8.aln':'THAF8',
    'RoseovariusTHAF9.aln':'THAF9',
    'Ruegeria_AD91A.aln':'AD91A',
    'Ruegeria_pomeroyi_DSS-3.aln':'DSS3',
    'Ruegeria_THAF33.aln':'THAF33',
    'Ruegeria_TM1040.aln':'TM1040',
    'Sulfitobacter_AM1-D1.aln':'AM1D1',
    'Sulfitobacter_BSw21498.aln':'BSW21498',
    'Sulfitobacter_D7.aln':'D7',
    'Sulfitobacter_JL08.aln':'JL08',
    'Sulfitobacter_SK011.aln':'SK011',
    'Sulfitobacter_SK012.aln':'SK012',
    'Sulfitobacter_SK025.aln':'SK025',
    'Sulfitobacter_THAF37.aln':'THAF37',
}




if __name__=="__main__":
    file = open('../data/roseobacter_100000_read_length_110.txt','r')
    file_replaced_tree = open('../data/roseobacter_100000_read_length_110_mapping.txt','a+')
    for line in file:
        for key in rosebecter.keys():
            line = line.replace(key, rosebecter.get(key))

        file_replaced_tree.write('{}\n'.format(line))

