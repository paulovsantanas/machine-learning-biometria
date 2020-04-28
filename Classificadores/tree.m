function acuracia_md1 = tree(TrainImages, TrainLabels, TestImages, TestLabels)
    fprintf('\n\n-> Modelo: Decision Tree...');
    fprintf('\n-> Realizando Treinamento...\n');
    tic
    Md1 = fitctree(TrainImages,TrainLabels,'MinLeafSize',55);
    toc
    fprintf('<- Treinamento Conclu�do.')

    fprintf('\n\n-> Realizando Teste...\n');
    tic
    y_predicted_md1 = predict(Md1, double(TestImages));
    acuracia_md1 = sum(y_predicted_md1 == TestLabels)/length(TestLabels)*100;
    toc
    fprintf('<- Teste Conclu�do.')
end