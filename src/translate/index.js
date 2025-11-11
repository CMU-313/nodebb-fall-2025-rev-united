/* eslint-disable strict */
const translatorApi = module.exports;

// translatorApi.translate = async function (postData) {
//     const TRANSLATOR_API = 'http://host.docker.internal:5000';
//     const response = await fetch(TRANSLATOR_API + '/?content=' + postData.content);
//     const data = await response.json();
//     return [data.is_english, data.translated_content];
// };

translatorApi.translate = async function (postData) {
	const TRANSLATOR_API = 'http://host.docker.internal:5000';
	try {
		const response = await fetch(TRANSLATOR_API + '/?content=' + postData.content);
		const data = await response.json();
		return [data.is_english, data.translated_content];
	} catch (e) {
		// If the API is down or any error occurs, return false and the original postData
		return [false, postData];
	}
};