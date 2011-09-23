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
	 * The NodeTypeTemplate interface represents a simple container structure used
	 * to define node types which are then registered through the
	 * NodeTypeManager.register_node_type() method.
	 *
	 * NodeTypeTemplateInterface, like NodeTypeInterface, is a subclass of 
	 * NodeTypeDefinitionInterface so it shares with NodeTypeInterface those 
	 * methods that are relevant to a static definition.
	 * In addition, NodeTypeTemplate provides methods for setting the attributes of
	 * the definition. Implementations of this interface need not contain any
	 * validation logic.
	 *
	 * See the corresponding get methods for each attribute in NodeTypeDefinitionInterface
	 * for the default values assumed when a new empty NodeTypeTemplateInterface is created
	 * (as opposed to one extracted from an existing NodeTypeInterface).
	 *
	 */
	public interface NodeTypeTemplate : Object, NodeTypeDefinition {

		/**
		 * Sets the name of the node type.
		 *
		 * @param name The name of the node type to be set.
		 * @return void
		 */
		public abstract void set_name (string name);

		/**
		 * Sets the names of the supertypes of the node type.
		 *
		 * @param names The name of the node supertype to be set.
		 * @return void
		 */
		public abstract void set_declared_super_type_names (string[] names);

		/**
		 * Sets the abstract flag of the node type.
		 *
		 * @param abstractStatus The status of the node type being abstract.
		 * @return void
		 */
		public abstract void set_abstract (bool abstractStatus);

		/**
		 * Sets the mixin flag of the node type.
		 *
		 * @param mixin The status of the node type being <b>mixin</b>.
		 * @return void
		 */
		public abstract void set_mixin (bool mixin);

		/**
		 * Sets the orderable child nodes flag of the node type.
		 *
		 * @param orderable The status of the node type having orderable children.
		 * @return void
		 */
		public abstract void set_orderable_child_nodes(bool orderable);

		/**
		 * Sets the name of the primary item.
		 *
		 * @param name The name of the primary item.
		 * @return void
		 */
		public abstract void set_primary_item_name (string name);

		/**
		 * Sets the queryable status of the node type.
		 *
		 * @param queryable The status of the node type being queryable.
		 * @return void
		 */
		public abstract void set_queryable (bool queryable);

		/**
		 * Returns a mutable List of PropertyDefinitionTemplate objects.
		 *
		 * To define a new NodeTypeTemplate or change an existing one,
		 * PropertyDefinitionTemplate objects can be added to or removed from this List.
		 *
		 * @return array of {@link PropertyDefinitionTemplate} objects
		 */
		public abstract PropertyDefinitionTemplate[] get_property_definition_templates ();

		/**
		 * Returns a mutable List of NodeDefinitionTemplate objects.
		 *
		 * To define a new NodeTypeTemplate or change an existing one,
		 * NodeDefinitionTemplate objects can be added to or removed from this List.
		 *
		 * @return array of {@link NodeDefinitionTemplate} objects
		 */
		public abstract NodeDefinitionTemplate[] get_node_definition_templates ();
	}
}
