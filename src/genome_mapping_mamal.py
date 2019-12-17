
rosebecter = {
    'Bos_taurus_01449.aln':'A',
    'Canis_lupus.aln':'B',
    'Equus_caballus_equcab3.0.aln':'C',
    'Felis_catus_9.0.aln':'D',
    'Macaca_AG07107.aln':'E',
    'Microcebus_murinus_Mmur_3.0.aln':'F',
    'Oryctolagus_cuniculus_OryCun2.0.aln':'G'
}




if __name__=="__main__":
    file = open('../data/29mamals_10000_all_trees.txt','r')
    file_replaced_tree = open('../data/29mamals_10000_all_trees_mapping.txt','a+')
    for line in file:
        for key in rosebecter.keys():
            line = line.replace(key, rosebecter.get(key))

        file_replaced_tree.write('{}\n'.format(line))
    file_replaced_tree.close()
    file.close()

