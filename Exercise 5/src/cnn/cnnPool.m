function pooledFeatures = cnnPool(poolDim, convolvedFeatures)
%cnnPool Pools the given convolved features
%
% Parameters:
%  poolDim - dimension of pooling region
%  convolvedFeatures - convolved features to pool (as given by cnnConvolve)
%                      convolvedFeatures(imageRow, imageCol, featureNum, imageNum)
%
% Returns:
%  pooledFeatures - matrix of pooled features in the form
%                   pooledFeatures(poolRow, poolCol, featureNum, imageNum)
%     

numImages = size(convolvedFeatures, 4);
numFilters = size(convolvedFeatures, 3);
convolvedDim = size(convolvedFeatures, 1);

pooledFeatures = zeros(convolvedDim / poolDim, ...
        convolvedDim / poolDim, numFilters, numImages);

    
    
% Instructions:
%   Now pool the convolved features in regions of poolDim x poolDim,
%   to obtain the 
%   (convolvedDim/poolDim) x (convolvedDim/poolDim) x numFeatures x numImages 
%   matrix pooledFeatures, such that
%   pooledFeatures(poolRow, poolCol, featureNum, imageNum) is the 
%   value of the featureNum feature for the imageNum image pooled over the
%   corresponding (poolRow, poolCol) pooling region. 
%   
%   Use mean pooling here.

%%% Add code here
separation =  poolDim * ones(1, convolvedDim /poolDim);

for i=1:numImages
    for j=1:numFilters
        %separating the convolvedFeatures in cells to obtain the mean of each cells
        d=mat2cell(convolvedFeatures(:,:,j,i),separation, separation);
        new = zeros(size(d,1));
        for k=1:size(d,1)
            for r=1:size(d,1);
            new(k,r) = mean2(d{k,r});
            end
         end
        
       % result = reshape(new, (convolvedDim/poolDim),(convolvedDim/poolDim));
        pooledFeatures(:,:,j,i) = new;
    end

end

end

