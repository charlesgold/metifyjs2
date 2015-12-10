/***
 * Metify.js
 * v1.0.0
 * Charlie Topjian - charlietopjian.com
 * 
 * an attempt to allow shopify store owners the ability to split up their
 * product content. Currently shopify outputs the content as liquid tag {{ product.content }} or {{ product.description }}
 *  
 * references:
 * http://www.shopify.com/?ref=charlietopjian 
 * http://docs.shopify.com/themes/liquid-variables/product
 * 
 * License
 * 
 * The MIT License (MIT)
 * Copyright (c) 2013 Charlie Topjian
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

var metify	=	function(shopify){
	
	//Set class name of all selectors which will be looked at
	var mfClass			=	'metify';
	//Set ID of selector holding shopify raw product.content
	this.shopifyContent	=	(typeof shopify !== 'undefined')?shopify:'mf-product-raw';
	this.shopifyContentElem	=	document.getElementById('mf-product-raw');
	//Set Attribute name of meta keys
	this.metaKeys		=	'data-mf-meta-key';
		
	
	function countMeta(shopifyContent,mfClass){
		
		if(document.getElementById(shopifyContent)){
		
			//set var equal to selector
			var metaSelectors	= document.getElementById(shopifyContent).getElementsByClassName(mfClass);		
			console.log(metaSelectors.length);
			
			return metaSelectors.length;
		} else { //shopify raw content block not found
			console.log('DEBUG::mf-product-raw not found');			
		}
	}
	
	
	function metifyIt(shopifyContent,mfClass,metaKeys){
		
		hideRaw();
		//Iterate through each meta "blocked" element found in productContent
		var metas	=	document.getElementById(shopifyContent).getElementsByClassName(mfClass);
		
		//Run through
		var sucMetify	=	0;
		for(var i=0;i<metas.length;i++){
			
			//get metaKey from attribute specified.
			var mK	=	metas[i].getAttribute(metaKeys);
			//get metaValue for metaKey
			var mV	=  	metas[i].innerHTML;
						
			//now we will find the selector that has the matching ID and data-role.
			if(document.getElementById(mK)){
				var mKMatch	=	document.getElementById(mK);
				mKMatch.innerHTML	=	mV;
				
				//Add up successful metified values to return.
				sucMetify++;
			} else { //mkMatch "metaValue" div with ID not found.
				console.log('DEBUG::no matching div for meta found ' + mK );
			}
		
		}	
		
		return sucMetify;
	}

	//eliminates the need for CSS for raw elements
	function hideRaw(){

	    shopifyContentElem.style.display = "none";
	}
	
	//Make sure we have a defined DIV, SPAN, P with shopifyContent matching.
	if(countMeta(this.shopifyContent,mfClass)>0) {
		//Yes there exist metify metas to be parsed.
		this.metified	=	metifyIt(this.shopifyContent,mfClass,this.metaKeys);		
	} else { //no metify present on page.
		console.log('DEBUG::not metify present');
		this.metaKeys	=	0;
	}
	
	
};



