const tf = require('@tensorflow/tfjs-node');

MODEL_URL='https://storage.googleapis.com/ml-storage-production/model-in-prod/model.json';

async function loadModel() {
    return tf.loadGraphModel(MODEL_URL);
}

module.exports = loadModel;