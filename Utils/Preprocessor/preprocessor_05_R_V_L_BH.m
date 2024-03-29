function I = preprocessor_05_R_V_L_BH(imagem)
    for y = 1:size(imagem,1)
        if imagem(y, size(imagem,2), :) > 45
            yMaoSuperior = y;
            break
        end
    end
    for y = size(imagem,1):-1:1
        if imagem(y, size(imagem,2), :) > 45
            yMaoInferior = y;
            break
        end
    end
    imagemCrop = imagem(yMaoSuperior:yMaoInferior, :, :);
    
    centroid = [fix(0.525*size(imagemCrop,1)), fix(0.55*size(imagemCrop,2))];
    d1 = 142;
    d2 = 200;

    E1 = (centroid(1) - d1):(centroid(1) + d1);
    E2 = (centroid(2) - d2):(centroid(2) + d2);

    ROI = imagemCrop(E1,E2,:);
    
    ROI_filtered = medfilt3(ROI, [15,15,3],'symmetric');

    adaptHistEqualR = adapthisteq(ROI_filtered(:,:,1));
    adaptHistEqualG = adapthisteq(ROI_filtered(:,:,2));
    adaptHistEqualB = adapthisteq(ROI_filtered(:,:,3));

    adaptHistEqualRGB(:,:,1) = adaptHistEqualR;
    adaptHistEqualRGB(:,:,2) = adaptHistEqualG;
    adaptHistEqualRGB(:,:,3) = adaptHistEqualB;
    
%     folder = dir(['E:\Pontificia Universidade Catolica de Goias\TCC\Projeto\saim\Preprocessed\' '*.tif']);
%     index = size(folder,1) + 1;
%     path = strcat('E:\Pontificia Universidade Catolica de Goias\TCC\Projeto\saim\Preprocessed\',int2str(index));
%     imwrite(adaptHistEqualRGB, strcat(path,'_mao.tif'));
    
    I = adaptHistEqualRGB;
end
