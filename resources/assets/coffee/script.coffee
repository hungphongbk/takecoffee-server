(($)->
  $.openDialogAjax=(url,target,css=null,events=null)->
    $.ajax
      type:'GET'
      url:url
      success:(data)->
        target=$(target)
        target.find('.modal-content').html data
        if css
          dialog = target.find '.modal-dialog'
          dialog.css css
        if events
          for e,f of events
            if e.indexOf('->')==-1
              target.on e,f
            else
              childTarget = e.split '->'
              $childTarget = $(childTarget[0].trim())
              childEvent = childTarget[1].trim()
              $childTarget.on childEvent,f
        target.modal 'show'
        return
      error:->
        alert 'failure'
  $.fn.extend
    extendedFileInput:(url)->
      @each ->
        $this = $(@)
        $form = $this.closest('form')[0]
        $inputType = $form['upload_type']
        $existingId = $form['existing_id']
        $btnSelectExisting = $this.find('.select-existing')
        $selectDialog = $('#selectModal')

        toggleInputType=(value)->
          $($inputType).val(value)
        showSelectDialog=->
          css=
            'margin-top':'60px'
          $.openDialogAjax url,$selectDialog,css,
            'shown.bs.modal': (e)->
              $dialog=$(e.target)
              selectable=$dialog.find('.ui-selectable')
              selectable.selectable
                stop:->
                  id=$('.ui-selected').data('id')
                  return
              return

            'hidden.bs.modal': ->
              $(@).data 'bs.modal',null
              return

            '.select-btn->click': ->
              alert 'fuck you'
              return

        $this.on 'change.bs.fileinput',->
          toggleInputType 0

        $btnSelectExisting.on 'click',->
          showSelectDialog()

        return
) jQuery