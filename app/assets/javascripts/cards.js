/* global $, Stripe, Charge */
//Document ready
$(document).on('turbolinks:load', function() {
    var checkoutform = $('#checkout-form');
    var submitBtn = $('#form-submit-btn');
    
    // So Stripe knows who we are and we can do calls to stripe
    Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content') );

    submitBtn.click(function(event) {
        //prevent default submission behavior
        event.preventDefault();
        submitBtn.val("Processing").prop('disabled', true);
        
        var ccNum = $('#card_number').val(),
            cvcNum = $('#card_code').val(),
            expMonth = $('#card_month').val(),
            expYear = $('#card_year').val();
        
        //Use Stripe JS library to check for card errors.
        var error = false;
        
        //Validate card
        if (!Stripe.card.validateCardNumber(ccNum)) {
            error = true;
            alert('The credit card number appears to be invalid');
        }
        
        if (!Stripe.card.validateCVC(cvcNum)) {
            error = true;
            alert('The cvc number appears to be invalid');
        }
        
        if (!Stripe.card.validateExpiry(expMonth, expYear)) {
            error = true;
            alert('The expiration date appears to be invalid');
        }
        
        if (error) {
            submitBtn.prop('disabled', false).val("Submit");
        } 
        else {
            Stripe.createToken({
            number: ccNum, 
            cvc: cvcNum,
            exp_month: expMonth,
            exp_year: expYear
            }, stripeResponseHandler);
        }
        
        
        return false;
    });
    
    function stripeResponseHandler(status, response) {
        //Get token from response
        var token = response.id;
        
        // TODO: WRITE CODE TO CREATE STRIPE CHARGE AND HANDLER
        // WE MAKIN US A STORE WOOOOOOOOOOOOOOOOOOOOOOOOOOOOO
        
        
        checkoutform.append( $('<input type="hidden" name="user[stripe_customer_token">').val(token) );
        checkoutform.get(0).submit();
    }
    //Stripe will return a card toekn.
    //Inject card token as hidden field into form.
    //Submit form to our rails app
});