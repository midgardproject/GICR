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
	 * The NodeDefinitionTemplate interface extends NodeDefinition with the addition
	 * of write methods, enabling the characteristics of a child node definition to
	 * be set, after which the NodeDefinitionTemplate is added to a NodeTypeTemplate.
	 *
	 * See the corresponding get methods for each attribute in NodeDefinition for the
	 * default values assumed when a new empty NodeDefinitionTemplate is created (as
	 * opposed to one extracted from an existing NodeType).
	 *
	 */
	public interface NodeDefinitionTemplate : Object, ItemDefinition, NodeDefinition {

		/**
		 * Sets the name of the node.
		 *
		 * @param name The name of the node.
		 * @return void
		 */
		public abstract void set_name (string name);

		/**
		 * Sets the auto-create status of the node.
		 *
		 * @param autoCreated The status the autocreate attribute of the node shall have.
		 * @return void
		 */
		public abstract void set_auto_created (bool autoCreated);

		/**
		 * Sets the mandatory status of the node.
		 *
		 * @param mandatory The status of the mandatory attribute.
		 * @return void
		 */
		public abstract void set_mandatory (bool mandatory);

		/**
		 * Sets the on-parent-version status of the node.
		 *
		 * @param opv An integer constant member of OnParentVersionAction.
		 * @return void
		 */
		public abstract void set_on_parent_version (int opv);

		/**
		 * Sets the protected status of the node.
		 *
		 * @param protectedStatus The status of the protected attribute.
		 * @return void
		 */
		public abstract void set_protected (bool protectedStatus);

		/**
		 * Sets the names of the required primary types of this node.
		 *
		 * @param requiredPrimaryTypeNames List of primary type names to be registered.
		 * @return void
		 */
		public abstract void set_required_primary_type_names (string[] requiredPrimaryTypeNames);

		/**
		 * Sets the name of the default primary type of this node.
		 *
		 * @param defaultPrimaryTypeName The name of a primary type name to be registered.
		 * @return void
		 */
		public abstract void set_default_primary_type_name (string defaultPrimaryTypeName);

		/**
		 * Sets the same-name sibling status of this node.
		 *
		 * @param allowSameNameSiblings The status the same-name sibling attribute shel be set to.
		 * @return void
		 */
		public abstract void set_same_name_siblings (bool allowSameNameSiblings);
	}
}
