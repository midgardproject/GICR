/* 
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

namespace GICR {

	/**
 	 * The PropertyDefinitionTemplate interface extends PropertyDefinition with the
	 * addition of write methods, enabling the characteristics of a child property
	 * definition to be set, after which the PropertyDefinitionTemplate is added to
	 * a NodeTypeTemplate.
 	 *
	 * See the corresponding get methods for each attribute in PropertyDefinition for
	 * the default values assumed when a new empty PropertyDefinitionTemplate is created
	 * (as opposed to one extracted from an existing NodeType).
	 */
	public interface PropertyDefinitionTemplate : Object, PropertyDefinition {
	
		/**
		 * Sets the name of the property.
		 *
		 * @param name The name of the property definition template.
		 * @return void
		 */
		public abstract void set_name (string name);

		/**
		 * Sets the auto-create status of the property.
		 *
		 * @param autoCreated Flag to set the ability to be automatically created.
		 * @return void
		 */
		public abstract void set_auto_created (bool autoCreated);

		/**
		 * Sets the mandatory status of the property.
		 *
		 * @param mandatory The mandatory status of the property.
		 * @return void
		 */
		public abstract void set_mandatory(bool mandatory);

		/**
		 * Sets the on-parent-version status of the property.
		 *
		 * @param opv an int constant member of OnParentVersionAction.
		 * @return void
		 */
		public abstract void set_on_parent_version (int opv);

		/**
		 * Sets the protected status of the property.
		 *
		 * @param protectedStatus The protection status of the property.
		 * @return void
		 */
		public abstract void set_protected (bool protectedStatus);

		/**
		 * Sets the required type of the property.
		 *
		 * @param type An integer constant member of PropertyType.
		 * @return void
		 */
		public abstract void set_required_type (int type);

		/**
		 * Sets the value constraints of the property.
		 *
		 * @param constraints array of constrains registered on the property.
		 * @return void
		 */
		public abstract void set_value_constraints (string[] constraints);

		/**
		 * Sets the default value (or values, in the case of a multi-value property)
		 * of the property.
		 *
		 * @param defaultValues an array of values in the correct type for this property.
		 * @return void
		 */
		public abstract void set_default_values (string[] defaultValues);

		/**
		 * Sets the multi-value status of the property.
		 *
		 * @param multiple The status of the ability to store multiple values.
		 * @return void
		 */
		public abstract void set_multiple (bool multiple);

		/**
		 * Sets the queryable status of the property.
		 *
		 * @param operators An array of String constants {@link PropertyDefinition.get_available_query_operators}.
		 * @return void
		 */
		public abstract void set_available_query_operators (string[] operators);

		/**
		 * Sets the full-text-searchable status of the property.
		 *
		 * @param fullTextSearchable The status of the ability to be fulltext-searchable..
		 * @return void
		 */
		public abstract void set_full_text_searchable (bool fullTextSearchable);

		/**
		 * Sets the query-orderable status of the property.
		 *
		 * @param queryOrderable The status of the ability being query-orderable.
		 * @return void
		 */
		public abstract void set_query_orderable (bool queryOrderable);
	}
}
