{*<!-- {[The file is published on the basis of YetiForce Public License 3.0 that can be found in the following directory: licenses/LicenseEN.txt or yetiforce.com]} -->*}
{strip}
	<input type="hidden" id="typeApi" name="typeApi" value="{$TYPE_API}">
	<input type="hidden" id="record" name="record" value="{$RECORD_MODEL->getId()}">
	<form class="form-horizontal validateForm" id="editForm">
		<div class="modal-header">
			{if !$RECORD_MODEL->getId()}
				<h5 class="modal-title"><span class="fas fa-plus fa-sm mr-1"></span>{\App\Language::translate('LBL_CREATE_RECORD', $QUALIFIED_MODULE)}</h5>
			{else}
				<h5 class="modal-title"><span class="fas fa-edit fa-sm mr-1"></span>{\App\Language::translate('LBL_CREATE_RECORD', $QUALIFIED_MODULE)}</h5>
			{/if}
			<button class="btn btn-warning" data-dismiss="modal" title="{\App\Language::translate('LBL_CLOSE')}">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<div class="modal-body">
			{foreach from=$RECORD_MODEL->getEditFields() item=LABEL key=FIELD_NAME name=fields}
				{assign var="FIELD_MODEL" value=$RECORD_MODEL->getFieldInstanceByName($FIELD_NAME)->set('fieldvalue',$RECORD_MODEL->get($FIELD_NAME))}
				<div class="form-group row">
					<label class="col-form-label col-md-3 u-text-small-bold text-right">
						{\App\Language::translate($LABEL, $QUALIFIED_MODULE)}
						{if $FIELD_MODEL->isMandatory()}<span class="redColor">*</span>{/if}:
					</label>
					<div class="col-md-9 fieldValue">
						{include file=\App\Layout::getTemplatePath($FIELD_MODEL->getUITypeModel()->getTemplateName(), $QUALIFIED_MODULE) FIELD_MODEL=$FIELD_MODEL MODULE=$QUALIFIED_MODULE}
					</div>
				</div>
			{/foreach}
		</div>
		{include file=\App\Layout::getTemplatePath('Modals/Footer.tpl')}
	</form>
{/strip}
